import 'package:bloc/bloc.dart';
import 'package:bloc_architecture/model/user.dart';
import 'package:bloc_architecture/service/network/api_repository.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ApiRepository api;

  UserBloc({required this.api}) : super(LoadingState()) {
    on<GetAllUser>(onGetAllUser);
  }

  Future<void> onGetAllUser(event, emit) async {
    emit(LoadingState());
    try {
      final List<User>? userList;
      userList = await api.getAllUser();
      emit(LoadState(userList: userList ?? []));
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }



}
