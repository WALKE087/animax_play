import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onDestinationSelected;

  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: onDestinationSelected,
      indicatorColor: Colors.amber,
      selectedIndex: currentIndex,
      destinations: const <NavigationDestination>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Películas',
        ),
        NavigationDestination(
          icon: Icon(Icons.notifications),
          label: 'Notificaciones',
        ),
        NavigationDestination(icon: Icon(Icons.message), label: 'Mensajes'),
      ],
    );
  }
}
