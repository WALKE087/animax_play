import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/movie_model.dart';
import 'movie_remote_datasource.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDataSourceImpl(this.client);

  final String baseUrl = 'https://localhost:7082/api/Movies';

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await client.get(Uri.parse('$baseUrl/popular'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'] as List;

      return results.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar películas populares');
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await client.get(
      Uri.parse('$baseUrl/search?query=$query'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'] as List;

      return results.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception('Error al buscar películas');
    }
  }
}
