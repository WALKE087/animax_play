import 'package:animax_play/core/network/http_client.dart';
import 'package:animax_play/data/datasources/movie_remote_datasource_impl.dart';
import 'package:animax_play/data/repositories/movie_repository_impl.dart';
import 'package:animax_play/domain/usecases/get_popular_movies.dart';
import 'package:animax_play/presentation/pages/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  final dataSource = MovieRemoteDataSourceImpl(httpClient);
  final repository = MovieRepositoryImpl(dataSource);
  final getPopularMovies = GetPopularMovies(repository);

  runApp(MyApp(getPopularMovies: getPopularMovies));
}

class MyApp extends StatelessWidget {
  final GetPopularMovies getPopularMovies;

  const MyApp({super.key, required this.getPopularMovies});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: MainNavigation(getPopularMovies: getPopularMovies),
    );
  }
}
