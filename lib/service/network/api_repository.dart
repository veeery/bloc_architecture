import 'package:bloc_architecture/model/pagenation.dart';
import 'package:bloc_architecture/model/user.dart';
import 'package:bloc_architecture/service/network/app_dio.dart';
import 'package:dio/dio.dart';

class ApiRepository {
  static final String baseUrl = AppDio.baseUrl;

  Future<DataReturnWithPagination> getAllFriend({required int currentPage, required int totalPages, required int limit}) async {
    late DataReturnWithPagination dataReturnWithPagination;

    bool apiStatus = await AppDio.executeApiWithTryCatch(() async {
      Response response = await AppDio.dio().get("users",
          queryParameters: {"page": currentPage, "total_pages": totalPages, "per_page": limit},
          options: AppDio.headers);

      // Add data from response to List
      List<dynamic> result = response.data['data'];

      // Json Data List & Pagination
      var listUser = result.map((e) => User.fromJson(e)).toList();
      var tempPage = DataReturnWithPagination.fromJson(response.data);

      // Add data to dataReturnWithPagination with Generic
      dataReturnWithPagination = DataReturnWithPagination<User>(
          currentIndex: tempPage.currentIndex, totalPages: tempPage.totalPages, dataReturn: listUser);

    });

    if (apiStatus) {
      // return data with Generic Class <User>
      return dataReturnWithPagination;
    } else {
      dataReturnWithPagination = DataReturnWithPagination.clearData();
      return dataReturnWithPagination;
    }
  }
}
