import 'package:bloc_architecture/constant/app_colors.dart';
import 'package:bloc_architecture/constant/app_textstye.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppButton {
  static primaryButton({
    required Function() onTap,
    final TextStyle? textStyle,
    final String? buttonName,
  }) {
    return MaterialButton(
      onPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();
        onTap();
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.r)),
      splashColor: AppColor.shadowColor,
      elevation: 20.r,
      color: AppColor.primaryColor,
      minWidth: 0.4.sw,
      height: 0.08.sh,
      child: Text(buttonName ?? "This Button No Title", style: textStyle ?? AppTextStyle.primaryText),
    );
  }

  static secondaryButton({
    required Function() onTap,
    required Icon icon,
    final TextStyle? textStyle,
  }) {
    return MaterialButton(
      onPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();
        onTap();
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.r)),
      splashColor: AppColor.shadowColor,
      elevation: 20.r,
      color: AppColor.gradient5,
      minWidth: 0.07.sh,
      height: 0.07.sh,
      child: icon
    );
  }


}
