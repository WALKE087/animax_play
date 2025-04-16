import 'package:animax_play/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> searchMovies(String query);
}
