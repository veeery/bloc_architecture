import 'package:bloc_architecture/model/comic.dart';
import 'package:bloc_architecture/model/user.dart';
import 'package:bloc_architecture/service/network/app_dio.dart';
import 'package:dio/dio.dart';

class ApiRepository {
  static final String baseUrl = AppDio.baseUrl;

  Future<List<Comic>?> getAllComic() async {

    List<Comic> listComic = [];

    bool apiStatus = await AppDio.executeApiWithTryCatch(() async {
      Response response = await AppDio.dio().get(
        "scrapper"
      );

      List<dynamic> result = response.data;
      listComic = result.map((e) => Comic.fromJson(e)).toList();
    });

    if (apiStatus) {
      return listComic;
    } else {
      listComic = [];
      return listComic;
    }

  }

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
      listUser = [];
      return listUser;
    }
  }

}
