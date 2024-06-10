import '/movie/domain/repositories/base_movie_repository.dart';
import '../entities/movie.dart';

class GetNowPlayingMovieUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMovieUseCase( this.baseMovieRepository);

  Future<List<Movie>> execute() async {
    return await baseMovieRepository.getNowPlayingMovie();
  }
}
