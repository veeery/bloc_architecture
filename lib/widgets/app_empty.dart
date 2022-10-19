import 'package:bloc_architecture/constant/app_textstye.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppEmpty extends StatelessWidget {

  final String message;
  final Function() onTap;

  AppEmpty({
    required this.message,
    required this.onTap
});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(message, style: AppTextStyle.primaryText),
          GestureDetector(
            onTap: onTap,
            child: Text("Klik Here to refresh", style: AppTextStyle.primaryText),
          )
        ],
      ),
    );
  }
}
