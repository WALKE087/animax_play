import 'package:flutter/material.dart';
import 'package:animax_play/presentation/pages/home_page.dart';
import 'package:animax_play/domain/usecases/get_popular_movies.dart';
import 'package:animax_play/data/repositories/movie_repository_impl.dart';
import 'package:animax_play/data/datasources/movie_remote_datasource_impl.dart';
import 'package:http/http.dart' as http;

void main() {
  final repository = MovieRepositoryImpl(
    MovieRemoteDataSourceImpl(http.Client()),
  );
  final getPopularMovies = GetPopularMovies(repository);

  runApp(MyApp(getPopularMovies: getPopularMovies));
}

class MyApp extends StatelessWidget {
  final GetPopularMovies getPopularMovies;

  const MyApp({super.key, required this.getPopularMovies});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimaxPlay',
      debugShowCheckedModeBanner: false,
      home: HomePage(getPopularMovies: getPopularMovies),
    );
  }
}
