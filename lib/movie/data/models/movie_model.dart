import '/movie/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.title,
    required super.posterPath,
    required super.id,
    required super.voteAverage,
    required super.overview,
    required super.voteCount,
    required super.genreIds,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        title: json['title'],
       // posterPath: json['poster_path'],
        posterPath: json['backdrop_path'],
        id: json["id"],
        voteAverage: json["vote_average"],
        overview: json["overview"],
        voteCount: json["vote_count"],
        genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
      );
}
