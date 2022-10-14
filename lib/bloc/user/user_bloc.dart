import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_architecture/model/user.dart';
import 'package:bloc_architecture/service/network/api_repository.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required this.api}) : super(UserInitial());

  final Api api;

  Future<void> fetchAllUser() async {
    emit(Loading());
    try {
      final List<User>? userList;
      userList = await api.getAllUser();
      emit(Loaded(userList: userList ?? []));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
