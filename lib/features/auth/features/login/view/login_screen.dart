import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proxvision/constants/assets_constants.dart';
import 'package:proxvision/features/auth/cubit/auth_cubit.dart';
import 'package:proxvision/features/widgets/base_screen.dart';
import 'package:proxvision/features/widgets/custom_button.dart';
import 'package:proxvision/features/widgets/custom_image_view.dart';
import 'package:proxvision/routing/app_routing.dart';
import 'package:proxvision/services/navigator_service.dart';
import 'package:proxvision/utils/size_utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      /// Auth Cubit added due to possibility of social login
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: appLogoFullBlack,
                height: 120.h,
              ),
              SizedBox(height: 33.h),
              CustomButton(
                text: "Login",
                onPressed: () {
                  NavigatorService.go(
                    AppRouting.introPath,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
