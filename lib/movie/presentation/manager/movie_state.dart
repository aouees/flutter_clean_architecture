part of 'movie_bloc.dart';

/// TODO factory pattern for state
abstract class MovieState extends Equatable {
  final RequestState requestState;
  final String? msg;
  final List<Movie>? moviesList;
  const MovieState({required  this.requestState, this.msg, this.moviesList});
}

class InitialState extends MovieState{
  const InitialState():super(requestState: RequestState.loading);
  @override
  List<Object?> get props => [requestState, msg, moviesList];

}

class TopRatedMoviesState extends MovieState {

  const TopRatedMoviesState({required  super.requestState, super.msg, super.moviesList});

  @override
  List<Object?> get props => [requestState, msg, moviesList];
}

class PopularMoviesState extends MovieState {

  const PopularMoviesState({required  super.requestState, super.msg, super.moviesList});

  @override
  List<Object?> get props => [requestState, msg, moviesList];
}


class NowPlayingMoviesState extends MovieState {

  const NowPlayingMoviesState({required  super.requestState, super.msg, super.moviesList});

  @override
  List<Object?> get props => [requestState, msg, moviesList];
}
