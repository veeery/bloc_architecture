
import 'package:bloc_architecture/pages/comic/comic_view.dart';
import 'package:bloc_architecture/pages/dashboard/dashboard_bar.dart';
import 'package:bloc_architecture/pages/home/home_view.dart';
import 'package:bloc_architecture/pages/profile/profile_view.dart';

class AppPages {

  static const String dashboard = "/dashboard";

  static const String home = "/home";
  static const String profile = "/profile";

  static const String comic = "/comic";
}

class AppRoutes {
  static final routes = {

    AppPages.dashboard : (context) => DashBoardBar(),

    AppPages.home : (context) => HomeView(),
    AppPages.profile : (context) => ProfileView(),

    AppPages.comic : (context) => ComicView(),

  };
}