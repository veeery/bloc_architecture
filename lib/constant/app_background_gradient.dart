import 'package:bloc_architecture/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppGradientBackground extends StatelessWidget {
  const AppGradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.gradient1,
            AppColor.gradient2,
            AppColor.gradient3,
            AppColor.gradient4,
            AppColor.gradient5,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft
        )
      ),
    );
  }
}
