import 'package:flutter/material.dart';
import 'package:proxvision/theme/colors.dart';
import 'package:proxvision/utils/size_utils.dart';

class SnackBarUtils {
  static void errorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: errorColor,
        showCloseIcon: true,
        margin: EdgeInsets.only(bottom: 20.h, right: 20.w, left: 20.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  static void successSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: successColor,
        showCloseIcon: true,
        margin: EdgeInsets.only(bottom: 20.h, right: 20.w, left: 20.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
