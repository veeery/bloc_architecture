part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetProfile extends UserEvent {

  final String id;

  const GetProfile({required this.id});

  @override
  List<Object> get props => [id];
}

