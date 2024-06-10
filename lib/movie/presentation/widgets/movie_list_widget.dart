
import 'package:flutter/material.dart';

import '../../../core/utils/screen_configuration.dart';
import '../../domain/entities/movie.dart';
import 'movie_list_tile_widget.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget(this.moviesList,{
    super.key,
  });
  final List<Movie> moviesList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenConfiguration.getHeight(context) / 3.0,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return MovieListTileWidget(moviesList[index]);
        },
        itemCount: moviesList.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
