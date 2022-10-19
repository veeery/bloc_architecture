part of 'friend_bloc.dart';

abstract class FriendState extends Equatable {
  const FriendState();
}

class FriendInitial extends FriendState {
  @override
  List<Object> get props => [];
}

class LoadingFriendState extends FriendState {
  @override
  List<Object> get props => [];
}

class LoadFriendState extends FriendState {
  @override
  List<User> userList;

  LoadFriendState({required this.userList});

  @override
  List<Object> get props => [userList];
}

class ErrorFriendState extends FriendState {

  String message;

  ErrorFriendState({required this.message});

  @override
  List<Object> get props => [message];
}