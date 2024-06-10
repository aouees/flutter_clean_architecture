part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
}
class GetNowPlayingMoviesEvent extends MovieEvent{

  @override
  List<Object?> get props => [];

  const GetNowPlayingMoviesEvent();
}

class GetPopularMoviesEvent extends MovieEvent{

  @override
  List<Object?> get props => [];

  const GetPopularMoviesEvent();
}
class GetTopRatedMoviesEvent extends MovieEvent{

  @override
  List<Object?> get props => [];

  const GetTopRatedMoviesEvent();
}