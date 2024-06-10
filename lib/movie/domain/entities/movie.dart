import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String title;
  final String posterPath;
  final int id;
  final num voteAverage;
  final String overview;
  final int voteCount;
  final List<int> genreIds;

  const Movie({
    required  this.title,
    required this.posterPath,
    required this.id,
    required  this.voteAverage,
    required  this.overview,
    required this.voteCount,
    required  this.genreIds,});

  @override
  List<Object> get props => [title, posterPath, id, voteAverage, overview, voteCount, genreIds,];



}
