import 'package:bloc/bloc.dart';
import 'package:bloc_architecture/model/pagenation.dart';
import 'package:bloc_architecture/model/user.dart';
import 'package:bloc_architecture/service/network/api_repository.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  int currentPage = 1;
  int totalPages = 1;

  UserBloc() : super(LoadingUserState()) {
    on<GetAllUser>(onGetAllUser);
  }

  Future<void> onGetAllUser(event, emit) async {
    final ApiRepository api = ApiRepository();

    await emit(LoadingUserState());
    try {
      DataReturnWithPagination dataReturnWithPagination;
      dataReturnWithPagination = await api.getAllFriend(currentPage: currentPage, totalPages: totalPages, limit: 6);
      await emit(LoadUserState(userList: dataReturnWithPagination.dataReturn as List<User>));
    } catch (e) {
      await emit(ErrorUserState(message: e.toString()));
    }
  }
}
