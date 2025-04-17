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
      indicatorColor: const Color.fromARGB(255, 47, 0, 255),
      selectedIndex: currentIndex,
      backgroundColor: Color.fromARGB(255, 3, 1, 35),
      destinations: const <NavigationDestination>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(
            Icons.home_outlined,
            color: Color.fromRGBO(244, 240, 0, 1),
          ),
          label: 'Películas',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.notifications,
            color: Color.fromRGBO(244, 240, 0, 1),
          ),
          label: 'Notificaciones',
        ),
        NavigationDestination(
          icon: Icon(Icons.message, color: Color.fromRGBO(244, 240, 0, 1)),
          label: 'Mensajes',
        ),
      ],
    );
  }
}
