import '../entities/movie.dart';
import '/movie/domain/repositories/base_movie_repository.dart';

class GetTopRatedMovieUseCase{
  final BaseMovieRepository baseMovieRepository;

  GetTopRatedMovieUseCase( this.baseMovieRepository);

  Future<List<Movie>> execute() async {
    return await baseMovieRepository.getTopRatedMovie();
  }

}