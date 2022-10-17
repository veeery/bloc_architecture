import 'package:bloc_architecture/bloc/user/user_bloc.dart';
import 'package:bloc_architecture/constant/app_overlay.dart';
import 'package:bloc_architecture/pages/app_routes.dart';
import 'package:bloc_architecture/service/network/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  BlocOverrides.runZoned(() {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {

  final ApiRepository api = ApiRepository();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: AppOverlay.mySystemTheme,
      child: ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: true,
          designSize: Size(1080, 2220),
          builder: (context, child) {
            return RepositoryProvider.value(
              value: api,
              // MultiBLocProvider mean, u can cast BlocProvider more than 1 at the same time for loaded Page
              // BlocProvider mean, u only can Cast 1 BloC to initiate or Loaded Page
              child: MultiBlocProvider(
                providers: [
                  //  This BloC for Users Tab in Navigation
                  BlocProvider<UserBloc>(
                    create: (context) => UserBloc(api: api)..add(GetAllUser()),
                  )
                ],
                child: MaterialApp(
                  builder: (context, child) {
                    return OrientationBuilder(
                      builder: (context, orientation) {
                        return MediaQuery(
                          data: MediaQuery.of(context).copyWith(
                              textScaleFactor: 1),
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
                ),
              ),
            );
          }),
    );
  }
}
