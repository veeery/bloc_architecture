import 'dart:ui';

import 'package:bloc_architecture/model/user.dart';
import 'package:bloc_architecture/widgets/app_button.dart';
import 'package:bloc_architecture/widgets/app_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppProfileOwnCard extends StatelessWidget {

  final User user;
  final EdgeInsets? padding;
  final Color colors;


  AppProfileOwnCard({
    required this.user,
    this.padding,
    this.colors = Colors.grey
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 0.9.sw,
      height: 0.35.sh,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 0.9.sw,
              height: 0.3.sh,
              padding: padding ?? EdgeInsets.symmetric(horizontal: 50.w, vertical: 50.h),
              decoration: BoxDecoration(
                  color: colors.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2,color: colors)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppNetworkImage(imageUrl: user.avatar!),
                  buildAttributeUser()
                ],
              ),
            ),
          ),
          Positioned.fill(
            bottom: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: buildOptionButton(),
              )
          )
        ],
      ),
    );

  }

  Widget buildAttributeUser() {
    return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${user.firstName} ${user.lastName}"),
            Text(user.email),
          ],
        )
    );
  }

  Widget buildOptionButton() {
    return Container(
      width: 0.7.sw,
      height: 0.1.sh,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 50.w),
      decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2,color: colors)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // This For FriendList View
          AppButton.secondaryButton(
            icon: Icon(FontAwesomeIcons.userGroup, size: 50.sp,),
            onTap: () {

            }
          ),
          // This for Edit Profile
          AppButton.secondaryButton(
              icon: Icon(FontAwesomeIcons.edit, size: 50.sp,),
              onTap: () {

              }
          ),
          // This Go To Etc of Profile like Setting to private Account, delete account, or some policy app
          AppButton.secondaryButton(
              icon: Icon(FontAwesomeIcons.list, size: 50.sp,),
              onTap: () {

              }
          )
        ],
      ),
    );
  }

}
