
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/enum.dart';
import '../../../core/utils/screen_configuration.dart';
import '../manager/movie_bloc.dart';
import '../widgets/movie_list_widget.dart';
import '../widgets/movies_carousel_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieBloc>(
      create: (context) => MovieBloc()
        ..add(const GetNowPlayingMoviesEvent())
        ..add(const GetPopularMoviesEvent())
        ..add(const GetTopRatedMoviesEvent()),
      child: SafeArea(
        left: false,
        right: false,
        child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  BlocBuilder<MovieBloc, MovieState>(
                    buildWhen: (previous, current) => current is NowPlayingMoviesState,
                    builder: (cxt, state) {
                      print('NowPlayingMoviesBuilder ${state.requestState} ${state.runtimeType}');
                      switch (state.requestState) {
                        case RequestState.complete:
                          return MoviesCarouselWidget(state.moviesList!);
                        case RequestState.loading:
                          return SizedBox.fromSize(
                            size: Size.fromHeight(ScreenConfiguration.getHeight(context) / 3),
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        case RequestState.error:
                          return SizedBox.fromSize(
                            size: Size.fromHeight(ScreenConfiguration.getHeight(context)/3),
                            child: Center(
                              child: Text(state.msg!),
                            ),
                          );
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:  5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Top Rated" ,style: Theme.of(context).textTheme.bodyLarge,),
                        TextButton(onPressed: (){},child:  Text('See More ->',style: Theme.of(context).textTheme.bodyLarge,),),
                      ],
                    ),
                  ),
                  BlocBuilder<MovieBloc, MovieState>(
                    buildWhen: (previous, current) => current is TopRatedMoviesState,
                    builder: (cxt, state) {
                      print("TopRatedMoviesBuilder ${state.requestState} ${state.runtimeType}");
                      switch (state.requestState) {
                        case RequestState.complete:
                          return MovieListWidget(state.moviesList!);
                        case RequestState.loading:
                          return SizedBox.fromSize(
                            size: Size.fromHeight(ScreenConfiguration.getHeight(context) / 3),
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        case RequestState.error:
                          return SizedBox.fromSize(
                            size: Size.fromHeight(ScreenConfiguration.getHeight(context)/3),
                            child: Center(
                              child: Text(state.msg!),
                            ),
                          );
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:  5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Popular" ,style: Theme.of(context).textTheme.bodyLarge,),
                        TextButton(onPressed: (){},child:  Text('See More ->',style: Theme.of(context).textTheme.bodyLarge,),),
                      ],
                    ),
                  ),
                  BlocBuilder<MovieBloc, MovieState>(
                    buildWhen: (previous, current) => current is PopularMoviesState,
                    builder: (cxt, state) {
                      print("PopularMoviesBuilder ${state.requestState} ${state.runtimeType}");
                      switch (state.requestState) {
                        case RequestState.complete:
                          return  MovieListWidget(state.moviesList!);
                        case RequestState.loading:
                          return SizedBox.fromSize(
                            size: Size.fromHeight(ScreenConfiguration.getHeight(context) / 3),
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        case RequestState.error:
                          return SizedBox.fromSize(
                            size: Size.fromHeight(ScreenConfiguration.getHeight(context)/3),
                            child: Center(
                              child: Text(state.msg!),
                            ),
                          );
                      }
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}