part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class LoadingUserState extends UserState {
  @override
  List<Object> get props => [];
}

class LoadUserState extends UserState {
  @override
  List<User> userList;

  LoadUserState({required this.userList});

  @override
  List<Object> get props => [userList];
}

class ErrorUserState extends UserState {

  String message;

  ErrorUserState({required this.message});

  @override
  List<Object> get props => [message];
}
