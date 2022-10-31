import 'package:bloc/bloc.dart';
import 'package:bloc_architecture/model/pagenation.dart';
import 'package:bloc_architecture/model/user.dart';
import 'package:bloc_architecture/service/network/api_repository.dart';
import 'package:equatable/equatable.dart';

part 'friend_event.dart';

part 'friend_state.dart';

class FriendBloc extends Bloc<FriendEvent, FriendState> {
  int currentPage = 1;
  int totalPages = 1;

  FriendBloc() : super(LoadingFriendState()) {
    on<GetAllFriend>(onGetAllFriend);
  }

  Future<void> onGetAllFriend(event, emit) async {
    final ApiRepository api = ApiRepository();

    await emit(LoadingFriendState());
    try {
      DataReturnWithPagination dataReturnWithPagination;
      dataReturnWithPagination = await api.getAllFriend(currentPage: currentPage, totalPages: totalPages, limit: 5);
      await emit(LoadFriendState(userList: dataReturnWithPagination.dataReturn as List<User>));
    } catch (e) {
      await emit(ErrorFriendState(message: e.toString()));
    }
  }
}
