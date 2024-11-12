import 'package:flutter/material.dart';
import 'package:proxvision/constants/assets_constants.dart';
import 'package:proxvision/features/widgets/base_screen.dart';
import 'package:proxvision/features/widgets/custom_image_view.dart';
import 'package:proxvision/theme/styles.dart';
import 'package:proxvision/utils/size_utils.dart';


/// This file is added because most authentication flow designs have a common outer structure with changing form body. It can be removed if not needed.

class AuthBaseScreen extends StatelessWidget {
  const AuthBaseScreen({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      showBackButton: true,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.only(top: 22.h, bottom: 40.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: appLogoBlack,
                        height: 125.h,
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        title,
                        style: Styles.titleLarge,
                      ),
                      SizedBox(height: 30.h),
                      Expanded(
                        child: body,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
