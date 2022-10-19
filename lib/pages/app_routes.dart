import 'package:bloc_architecture/pages/dashboard/dashboard_bar.dart';
import 'package:bloc_architecture/pages/friend/friend_list_view.dart';
import 'package:bloc_architecture/pages/home/home_view.dart';
import 'package:bloc_architecture/pages/profile/profile_view.dart';

class AppPages {

  static const String dashboard = "/dashboard";

  static const String home = "/home";
  static const String profile = "/profile";

  static const String friendList = "/friend-list";
}

class AppRoutes {
  static final routes = {

    AppPages.dashboard : (context) => DashBoardBar(),

    AppPages.home : (context) => HomeView(),
    AppPages.profile : (context) => ProfileView(),

    AppPages.friendList : (context) => FriendListView(),

  };
}