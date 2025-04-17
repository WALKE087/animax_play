import 'package:animax_play/presentation/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import '../../../domain/usecases/get_popular_movies.dart';
import '../../../domain/entities/movie.dart';

class PopularMoviesPage extends StatefulWidget {
  final GetPopularMovies getPopularMovies;

  const PopularMoviesPage({super.key, required this.getPopularMovies});

  @override
  State<PopularMoviesPage> createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  late Future<List<Movie>> _moviesFuture;

  @override
  void initState() {
    super.initState();
    _moviesFuture = widget.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Películas Populares")),
      body: FutureBuilder<List<Movie>>(
        future: _moviesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final movies = snapshot.data!;
            return GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.58,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: movies.length,
              itemBuilder: (_, index) => MovieCard(movie: movies[index]),
            );
          } else {
            return const Center(child: Text("No hay películas"));
          }
        },
      ),
    );
  }
}
