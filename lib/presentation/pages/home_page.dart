import 'package:animax_play/presentation/pages/popular_movies_pages.dart';
import 'package:animax_play/presentation/widgets/custom_navegation_bar.dart';
import 'package:flutter/material.dart';
import '../../domain/usecases/get_popular_movies.dart';

class HomePage extends StatefulWidget {
  final GetPopularMovies getPopularMovies;

  const HomePage({super.key, required this.getPopularMovies});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      PopularMoviesPage(getPopularMovies: widget.getPopularMovies),
      const Center(child: Text("Notificaciones")),
      const Center(child: Text("Mensajes")),
    ];
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _selectedIndex,
        onDestinationSelected: _onTabSelected,
      ),
    );
  }
}
