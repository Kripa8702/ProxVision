import 'package:flutter/material.dart';
import 'package:proxvision/constants/assets_constants.dart';
import 'package:proxvision/features/widgets/custom_image_view.dart';
import 'package:proxvision/services/navigator_service.dart';
import 'package:proxvision/theme/colors.dart';
import 'package:proxvision/theme/styles.dart';
import 'package:proxvision/utils/size_utils.dart';


class BaseScreen extends StatelessWidget {
  const BaseScreen({
    super.key,
    required this.child,
    this.background,
    this.title,
    this.showBackButton = false,
    this.verticalPadding = 0,
  });

  final Widget child;
  final Widget? background;
  final String? title;
  final bool? showBackButton;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        bottom: false,
        top: background == null,
        child: background != null
            ? Stack(
                children: [
                  background ?? Container(),
                  body,
                ],
              )
            : body,
      ),
    );
  }

  Widget get body => Column(
    children: [
      if (title != null || showBackButton != false) appBar,
      Expanded(
        child: SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: verticalPadding.h,
            ),
            child: child,
          ),
        ),
      ),
    ],
  );

  Widget get appBar => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (showBackButton ?? false)
              IconButton(
                icon: CustomImageView(
                  imagePath: backIcon,
                  height: 24.h,
                  width: 24.w,
                  color: secondaryTextColor,
                ),
                onPressed: () {
                  NavigatorService.goBack();
                },
              ),
            SizedBox(width: 8.w),
            Text(
              title ?? "",
              style: Styles.titleMedium.copyWith(
                  color: secondaryTextColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
  );
}
