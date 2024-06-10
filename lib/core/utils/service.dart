import 'package:flutter_clean_architecture/movie/data/data_sources/movie_remote_data_source.dart';
import 'package:flutter_clean_architecture/movie/data/repositories/movie_repository.dart';
import '../../movie/domain/repositories/base_movie_repository.dart';

import 'package:get_it/get_it.dart';
GetIt service= GetIt.instance;

class ServiceLocator{
 static init(){
   ///
   /// Register Movie Repository
   service.registerLazySingleton<BaseMovieRepository>(()=> MovieRepository(service()));

   ///
   /// Register Movie Data Source
   service.registerLazySingleton<BaseMovieRemoteDataSource>(()=> MovieRemoteDataSource());

  }

}