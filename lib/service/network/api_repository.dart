import 'package:bloc_architecture/model/user.dart';
import 'package:bloc_architecture/service/network/app_dio.dart';
import 'package:dio/dio.dart';

class Api {
  static final String baseUrl = AppDio.baseUrl;

  Future<List<User>?> getAllUser() async {
    List<User> listUser = [];

    bool apiStatus = await AppDio.executeApiWithTryCatch(() async {
      Response response = await AppDio.dio().get(
          "users?page=2",
          options: AppDio.headers
      );

      List<dynamic> result = response.data['data'];
      listUser = result.map((e) => User.fromJson(e)).toList();

    });
    if (apiStatus) {
      return listUser;
    } else {
      return [];
    }
  }

// Future getAllUser() async {
//   List<User> allUser = [];
//   var result;
//
//   bool apiStatus = await AppDio.executeApiWithTryCatch(() async {
//     Response response = await AppDio.dio().get(
//         "users?page=2"
//     );
//
//     result = response.data['data'];
//   });
//
//   if (apiStatus) {
//     for(var json in result) {
//       allUser.add(User.fromJson(json));
//     }
//     return allUser;
//   }
//   return [];
// }
//
// Future getUser() async {
//   User user;
//   var json;
//
//   bool apiStatus = await AppDio.executeApiWithTryCatch(() async {
//     Response response = await AppDio.dio().get(
//         "users/2"
//     );
//
//     json = response.data['data'];
//   });
//
//   if (apiStatus) {
//     user = User.fromJson(json);
//     return user;
//   }
// }
}
