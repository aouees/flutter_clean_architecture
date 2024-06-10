
import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/network/api_constance.dart';
import '../../domain/entities/movie.dart';

class MovieListTileWidget extends StatelessWidget {
  const MovieListTileWidget(this.movie, {
    super.key,
  });
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.network(ApiConstance.imageUrl(movie.posterPath)).image,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15.0),

        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: -40,
              child: Transform.rotate(
                angle: -pi / 4.0,
                child: Container(
                  width: 150,
                  color: Colors.red.shade800,
                  child:Text(
                    '${movie.voteAverage.toStringAsFixed(1)}/10',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
