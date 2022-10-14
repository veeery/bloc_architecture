
import 'package:bloc_architecture/pages/home/home_view.dart';
import 'package:bloc_architecture/pages/profile/profile_view.dart';

class AppPages {
  static const String home = "/home";
  static const String profile = "/profile";
}

class AppRoutes {
  static final routes = {

    AppPages.home : (context) => HomeView(),
    AppPages.profile : (context) => ProfileView(),

  };
}