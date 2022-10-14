part of 'comic_bloc.dart';

abstract class ComicState extends Equatable {
  const ComicState();
}

class ComicInitial extends ComicState {
  @override
  List<Object> get props => [];
}

class Loading extends ComicState {
  @override
  List<Object> get props => [];
}

class Loaded extends ComicState {

  final List<Comic> comicList;

  const Loaded({required this.comicList});

  @override
  List<Object> get props => [comicList];
}

class Error extends ComicState {

  String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}