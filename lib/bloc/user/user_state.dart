part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class Loading extends UserState {
  @override
  List<Object> get props => [];
}

class Loaded extends UserState {
  final List<User> userList;

  const Loaded({required this.userList});

  @override
  List<Object> get props => [userList];
}

class Error extends UserState {

  String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
