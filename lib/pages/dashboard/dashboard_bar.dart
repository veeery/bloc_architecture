import 'package:bloc_architecture/bloc/dashboard/dashboard_bloc.dart';
import 'package:bloc_architecture/pages/home/home_view.dart';
import 'package:bloc_architecture/pages/profile/profile_view.dart';
import 'package:bloc_architecture/widgets/app_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoardBar extends StatelessWidget {

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardBloc>(
      create: (context) => DashboardBloc(indexBottomPage: index)..indexBottomPage,
      child: Scaffold(
        extendBody: true,
        body: BlocListener<DashboardBloc, DashboardState>(
          listener: (context, state) {
            return null;
          },

          child: Stack(
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
                      // .setSelectedIndexPage(index: i);
                    },
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}

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