import 'package:bloc_architecture/pages/friend/friend_list_view.dart';
import 'package:bloc_architecture/pages/home/home_view.dart';
import 'package:bloc_architecture/pages/profile/profile_view.dart';
import 'package:bloc_architecture/widgets/app_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// This is Dashboard / BottomNavigation with
// Home, Profile
class DashBoardBar extends StatefulWidget {

  @override
  State<DashBoardBar> createState() => _DashBoardBarState();
}

class _DashBoardBarState extends State<DashBoardBar> {
  int index =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 1.sh,
            width: 1.sw,
            child: AppDisplayPage(index: index),
          ),
          Positioned(
              bottom: 0,
              width: 1.sw,
              child: AppBottomBar(
                index: index,
                onTap: (int i) {
                  setState(() {
                    index = i;
                  });
                },
              ))
        ],
      ),
    );
  }
}


// ignore: non_constant_identifier_names
Widget AppDisplayPage({int index = 0}) {
  switch (index) {
    case 0:
      return HomeView();
    case 1:
      return ProfileView();
    default:
      return HomeView();
  }
}
