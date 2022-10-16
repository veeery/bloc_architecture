part of 'initiate_app_bloc.dart';

abstract class InitiateAppState extends Equatable {
  const InitiateAppState();
}

class InitiateAppInitial extends InitiateAppState {
  @override
  List<Object> get props => [];
}

class Loading extends InitiateAppState {
  @override
  List<Object> get props => [];
}

class Loaded extends InitiateAppState {
  final List<User> userList;

  const Loaded({required this.userList});

  @override
  List<Object> get props => [userList];
}

class Error extends InitiateAppState {

  String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}