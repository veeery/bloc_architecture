import 'package:bloc/bloc.dart';
import 'package:bloc_architecture/model/user.dart';
import 'package:bloc_architecture/service/network/api_repository.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

  UserBloc() : super(LoadingUserState()) {
    on<GetProfile>(onGetProfile);
  }

  Future<void> onGetProfile(event, emit) async {
    final ApiRepository api = ApiRepository();

    await emit(LoadingUserState());
    try{
      User? user;
      if (event is GetProfile) {
        user = await api.getProfile(idUser: event.id);
      }
      await emit(LoadUserState(user: user!));
    } catch (e) {
      await emit(ErrorUserState(message: e.toString()));
    }
  }

}
