import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

  MovieModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.posterPath,
    required super.releaseDate,
    required super.voteAverage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: '$imageBaseUrl${json['backdrop_Path']}',
      releaseDate: json['release_Date'],
      voteAverage: (json['vote_Average'] as num).toDouble(),
    );
  }
}
