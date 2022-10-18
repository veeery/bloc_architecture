import 'package:bloc_architecture/model/comic.dart';
import 'package:bloc_architecture/model/pagenation.dart';
import 'package:bloc_architecture/model/user.dart';
import 'package:bloc_architecture/service/network/app_dio.dart';
import 'package:dio/dio.dart';

class ApiRepository {
  static final String baseUrl = AppDio.baseUrl;

  Future<List<Comic>?> getAllComic() async {
    List<Comic> listComic = [];

    bool apiStatus = await AppDio.executeApiWithTryCatch(() async {
      Response response = await AppDio.dio().get("scrapper");

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

  Future<DataReturnWithPagination> getAllUser({required int currentPage, required int totalPages, required int limit}) async {
    List<User> listUser = [];
    late DataReturnWithPagination dataReturnWithPagination;

    bool apiStatus = await AppDio.executeApiWithTryCatch(() async {
      Response response = await AppDio.dio().get("users",
          queryParameters: {"page": currentPage, "total_pages": totalPages, "per_page": limit},
          options: AppDio.headers);

      List<dynamic> result = response.data['data'];
      listUser = result.map((e) => User.fromJson(e)).toList();

      var tempPage = DataReturnWithPagination.fromJson(response.data);

      dataReturnWithPagination = DataReturnWithPagination<User>(
          currentIndex: tempPage.currentIndex, totalPages: tempPage.totalPages, dataReturn: listUser);

    });

    if (apiStatus) {
      return dataReturnWithPagination;
    } else {
      dataReturnWithPagination = DataReturnWithPagination.clearData();
      return dataReturnWithPagination;
    }
  }
}
