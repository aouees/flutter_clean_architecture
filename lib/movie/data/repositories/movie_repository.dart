import 'package:flutter_clean_architecture/movie/domain/entities/movie.dart';
import 'package:flutter_clean_architecture/movie/domain/repositories/base_movie_repository.dart';
import '../data_sources/movie_remote_data_source.dart';

class MovieRepository extends BaseMovieRepository {

  final BaseMovieRemoteDataSource _baseMovieRemoteDataSource;

  MovieRepository(this._baseMovieRemoteDataSource);

  @override
  Future<List<Movie>> getNowPlayingMovie() async {
    return await _baseMovieRemoteDataSource.getNowPlayingMovies();
  }

  @override
  Future<List<Movie>> getPopularMovie() async {
    return await _baseMovieRemoteDataSource.getPopularMovies();
  }

  @override
  Future<List<Movie>> getTopRatedMovie() async {
    return await _baseMovieRemoteDataSource.getTopRatedMovies();
  }
}
