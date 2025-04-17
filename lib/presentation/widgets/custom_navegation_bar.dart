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
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: const Color.fromARGB(255, 47, 0, 255),
        backgroundColor: const Color.fromARGB(255, 3, 1, 35),
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(
              color: Color.fromRGBO(244, 240, 0, 1),
              fontWeight: FontWeight.bold,
            );
          }
          return const TextStyle(color: Colors.white60);
        }),
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: Color.fromRGBO(244, 240, 0, 1));
          }
          return const IconThemeData(color: Colors.white60);
        }),
      ),
      child: NavigationBar(
        onDestinationSelected: onDestinationSelected,
        selectedIndex: currentIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Películas'),
          NavigationDestination(
            icon: Icon(Icons.notifications),
            label: 'Notificaciones',
          ),
          NavigationDestination(icon: Icon(Icons.message), label: 'Mensajes'),
        ],
      ),
    );
  }
}
