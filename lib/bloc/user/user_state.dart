part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class LoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class LoadState extends UserState {
  @override
  List<User> userList;

  LoadState({required this.userList});

  @override
  List<Object> get props => [userList];
}

class ErrorState extends UserState {

  String message;

  ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
