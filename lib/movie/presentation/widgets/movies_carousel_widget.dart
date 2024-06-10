
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/movie.dart';
import 'movie_slide_widget.dart';

class MoviesCarouselWidget extends StatelessWidget {
  const MoviesCarouselWidget(this.moviesList, {
    super.key,
  });
final List<Movie> moviesList;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: moviesList.map(
                (movie) {
              return MovieSlideWidget(movie);
            },
          ).toList(),
          options: CarouselOptions(
              viewportFraction: 1.0,
              aspectRatio: 4.0/3.0
          ),
        ),
        Positioned(
          top: 40,
          left: -50,
          child: Transform.rotate(
            angle: -pi / 4.0,
            child: Container(
              width: 200,
              color: Colors.red.shade800,
              child:Text(
                'Now Playing',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
