import 'package:animax_play/presentation/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_popular_movies.dart';

class PopularMoviesPage extends StatefulWidget {
  final GetPopularMovies getPopularMovies;

  const PopularMoviesPage({super.key, required this.getPopularMovies});

  @override
  State<PopularMoviesPage> createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  final ScrollController _scrollController = ScrollController();
  final List<Movie> _movies = [];
  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _fetchMovies();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 300 &&
        !_isLoading &&
        _hasMore) {
      _fetchMovies();
    }
  }

  Future<void> _fetchMovies() async {
    setState(() => _isLoading = true);
    try {
      final newMovies = await widget.getPopularMovies(page: _currentPage);
      setState(() {
        if (newMovies.isEmpty) {
          _hasMore = false;
        } else {
          _currentPage++;
          _movies.addAll(newMovies);
        }
      });
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "AnimaxPlay",
          style: TextStyle(color: Color.fromARGB(255, 238, 255, 0)),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.0, -1.0),
            end: Alignment(0.0, 0.0),
            colors: [Color(0xFF1D015B), Color.fromARGB(255, 3, 0, 28)],
            transform: GradientRotation(-1.5956),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: kToolbarHeight + MediaQuery.of(context).padding.top,
          ),
          child: GridView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.58,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: _movies.length + (_isLoading ? 1 : 0),
            itemBuilder: (_, index) {
              if (index < _movies.length) {
                return MovieCard(movie: _movies[index]);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
