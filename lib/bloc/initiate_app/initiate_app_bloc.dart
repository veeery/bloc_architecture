import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_architecture/model/user.dart';
import 'package:bloc_architecture/service/network/api_repository.dart';
import 'package:equatable/equatable.dart';

part 'initiate_app_event.dart';
part 'initiate_app_state.dart';

class InitiateAppBloc extends Bloc<InitiateAppEvent, InitiateAppState> {

  final Api api;

  InitiateAppBloc({required this.api}) : super(Loading()) {
    on<InitiateAppEvent>((event, emit) {

    });
  }
}
