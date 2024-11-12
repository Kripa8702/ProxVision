import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proxvision/constants/assets_constants.dart';
import 'package:proxvision/features/auth/cubit/auth_cubit.dart';
import 'package:proxvision/features/splash/cubit/splash_cubit.dart';
import 'package:proxvision/features/widgets/custom_image_view.dart';
import 'package:proxvision/routing/app_routing.dart';
import 'package:proxvision/services/navigator_service.dart';
import 'package:proxvision/theme/colors.dart';
import 'package:proxvision/utils/size_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SplashCubit>().init(context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            Future.delayed(
              const Duration(seconds: 2),
              () {
                NavigatorService.go(
                  state.authenticationStatus == AuthStatus.success
                      ? AppRouting.homePath
                      : AppRouting.authPath,
                );
              },
            );
          },
        ),
        BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state.status == SplashStatus.updateNotRequired) {
              context.read<AuthCubit>().initAuth();
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CustomImageView(
                imagePath: appLogoFullBlack,
                height: 100.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
