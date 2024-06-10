import '../entities/movie.dart';
import '/movie/domain/repositories/base_movie_repository.dart';

class GetPopularMovieUseCase{
  final BaseMovieRepository baseMovieRepository;

  GetPopularMovieUseCase( this.baseMovieRepository);

  Future<List<Movie>> execute() async {
    return await baseMovieRepository.getPopularMovie();
  }

}