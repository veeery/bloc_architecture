import 'package:bloc_architecture/constant/app_colors.dart';
import 'package:bloc_architecture/model/user.dart';
import 'package:bloc_architecture/widgets/app_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppProfileCard extends StatelessWidget {
  Color backgroundColor;
  User user;
  EdgeInsets? padding;

  AppProfileCard({
    required this.user,
    this.backgroundColor = AppColor.disableColor,
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 0.2.sh,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 50.w, vertical: 50.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.w),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppNetworkImage(imageUrl: user.avatar!),
          SizedBox(width: 20.w),
          buildAttributeUser()
        ],
      ),
    );
  }

  Widget buildAttributeUser() {
    return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("${user.firstName} ${user.lastName}"),
            Text(user.email),
            Text(user.avatar!)
          ],
        )
    );
  }
}
