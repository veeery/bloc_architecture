import 'package:bloc_architecture/constant/app_overlay.dart';
import 'package:bloc_architecture/pages/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  BlocOverrides.runZoned(() {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: AppOverlay.mySystemTheme,
      child: ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: true,
          designSize: Size(1080, 2220),
          builder: (context, child) {
            return MaterialApp(
              builder: (context, child) {
                return OrientationBuilder(
                  builder: (context, orientation) {
                    return MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(textScaleFactor: 1),
                      child: child!,
                    );
                  },
                );
              },
              debugShowCheckedModeBanner: false,
              title: "BloC Architecture",
              theme: ThemeData(fontFamily: "ProximaNova"),
              initialRoute: AppPages.dashboard,
              routes: AppRoutes.routes,
            );
          }),
    );
  }
}
