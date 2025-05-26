import 'package:flutter/material.dart';

void main() => runApp(const HooApp());

class HooApp extends StatelessWidget {
  const HooApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavigationBar());
  }
}

class NavigationBar extends StatefulWidget {
  const NavigationBar({super.key});

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
   int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Explorer', style: optionStyle),
    Text('Index 1: Mes reservations', style: optionStyle),
    Text('Index 2: Mon profil', style: optionStyle),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explorer'),
          BottomNavigationBarItem(icon: Icon(Icons.hotel), label: 'Mes réservations'),
          BottomNavigationBarItem(icon: Icon(Icons.face), label: 'Mon profil'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.cyan[400],
        onTap: _onItemTapped,
      ),
    );
  }
}