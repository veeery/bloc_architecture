import 'package:bloc_architecture/model/user.dart';
import 'package:bloc_architecture/widgets/app_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppProfileOwnCard extends StatelessWidget {

  User user;
  EdgeInsets? padding;

  AppProfileOwnCard({
    required this.user,
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.9.sw,
      height: 0.3.sh,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 50.w, vertical: 50.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.yellow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppNetworkImage(imageUrl: user.avatar!),
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
          ],
        )
    );
  }


}
