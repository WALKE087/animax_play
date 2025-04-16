import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/movie_remote_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Movie>> getPopularMovies() async {
    return await remoteDataSource.getPopularMovies();
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    return await remoteDataSource.searchMovies(query);
  }
}
