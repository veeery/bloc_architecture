part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetAllUser extends UserEvent {
  @override
  List<Object> get props => [];

}
