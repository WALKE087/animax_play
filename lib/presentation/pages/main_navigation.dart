import 'package:animax_play/domain/usecases/get_popular_movies.dart';
import 'package:animax_play/presentation/pages/popular_movies_pages.dart';
import 'package:animax_play/presentation/widgets/custom_navegation_bar.dart';
import 'package:flutter/material.dart';

class MainNavigation extends StatefulWidget {
  final GetPopularMovies getPopularMovies;

  const MainNavigation({super.key, required this.getPopularMovies});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      PopularMoviesPage(getPopularMovies: widget.getPopularMovies),
      const Center(child: Text('Notificaciones')),
      const Center(child: Text('Mensajes')),
    ];

    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: currentPageIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
    );
  }
}
