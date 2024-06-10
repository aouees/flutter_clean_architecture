
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/core/utils/enum.dart';
import 'package:flutter_clean_architecture/core/utils/service.dart';
import 'package:flutter_clean_architecture/movie/data/data_sources/movie_remote_data_source.dart';
import 'package:flutter_clean_architecture/movie/data/repositories/movie_repository.dart';
import 'package:flutter_clean_architecture/movie/domain/repositories/base_movie_repository.dart';
import 'package:flutter_clean_architecture/movie/domain/use_cases/get_now_playing_movie.dart';
import 'package:flutter_clean_architecture/movie/domain/use_cases/get_popular_movie.dart';
import 'package:flutter_clean_architecture/movie/domain/use_cases/get_top_rated_movie.dart';

import '../../domain/entities/movie.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(const InitialState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(GetNowPlayingMoviesEvent event, Emitter<MovieState> emit) async {
    try{
      emit(const NowPlayingMoviesState(requestState: RequestState.loading));

      List<Movie> moviesList =await GetNowPlayingMovieUseCase(service()).execute();
      
      emit(NowPlayingMoviesState(requestState: RequestState.complete,moviesList: moviesList));
    } on Exception catch (error) {
      emit(NowPlayingMoviesState(requestState: RequestState.error,msg: error.toString()));
    }
  }
  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MovieState> emit) async {
    try{
      emit(const TopRatedMoviesState(requestState: RequestState.loading));

      List<Movie> moviesList =await GetTopRatedMovieUseCase(service() ).execute();
      
      emit(TopRatedMoviesState(requestState: RequestState.complete,moviesList: moviesList));
    } on Exception catch (error) {
      emit(TopRatedMoviesState(requestState: RequestState.error,msg: error.toString()));
    }
  }
  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MovieState> emit) async {
    try{
      emit(const PopularMoviesState(requestState: RequestState.loading));

      List<Movie>  moviesList =await GetPopularMovieUseCase(service() ).execute();
      
      emit(PopularMoviesState(requestState: RequestState.complete,moviesList: moviesList));
    } on Exception catch (error) {
      emit(PopularMoviesState(requestState: RequestState.error,msg: error.toString()));
    }
  }
}
