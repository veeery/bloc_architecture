import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_architecture/model/comic.dart';
import 'package:bloc_architecture/service/network/api_repository.dart';
import 'package:equatable/equatable.dart';

part 'comic_event.dart';
part 'comic_state.dart';

class ComicBloc extends Bloc<ComicEvent, ComicState> {
  ComicBloc({required this.api}) : super(ComicInitial());

  final Api api;

  Future<void> fetchAllComic() async {
    emit(Loading());
    try {
      final List<Comic>? listComic;
      listComic = await api.getAllComic();
      emit(Loaded(comicList: listComic ?? []));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

}
