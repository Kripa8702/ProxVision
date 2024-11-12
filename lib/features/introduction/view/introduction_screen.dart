import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:proxvision/constants/assets_constants.dart';
import 'package:proxvision/features/widgets/base_screen.dart';
import 'package:proxvision/features/widgets/custom_image_view.dart';
import 'package:proxvision/theme/colors.dart';
import 'package:proxvision/theme/styles.dart';
import 'package:proxvision/utils/size_utils.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final languages = ["English", "Hindi", "Tamil", "Telugu"];

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      background: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  primaryColor,
                  Color(0xFF1E1E1E),
                ],
              ),
            ),
            child: Center(
              child: CustomImageView(
                imagePath: appLogoWhite,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          )
        ],
      ),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(20),
          ),
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 20.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImageView(
                  imagePath: appLogoFullBlack,
                  height: 50.h,
                ),
                SizedBox(height: 16.h),
                Text(
                  "Select your preferred language",
                  style: Styles.titleLarge,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 2.5,
                  ),
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          languages[index],
                          style: Styles.titleMedium.copyWith(
                            color: primaryColor,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
