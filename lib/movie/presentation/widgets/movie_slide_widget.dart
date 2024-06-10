import 'package:flutter/material.dart';
import '../../../core/network/api_constance.dart';
import '../../domain/entities/movie.dart';

class MovieSlideWidget extends StatelessWidget {
  const MovieSlideWidget(this.movie,{
    super.key,
  });
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),

      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.network(ApiConstance.imageUrl(movie.posterPath)).image,
          fit: BoxFit.cover,
          opacity: 0.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            movie.title,
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          Text(
            movie.overview,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}