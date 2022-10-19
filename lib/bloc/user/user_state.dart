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

  final User user;

  const LoadUserState({required this.user});

  @override
  List<Object> get props => [user];
}

class ErrorUserState extends UserState {

  final String message;

  const ErrorUserState({required this.message});

  @override
  List<Object> get props => [message];
}
