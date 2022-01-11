import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav(this._selectedIndex, this._onItemTapped, {Key? key})
      : super(key: key);

  final int _selectedIndex;
  final Function _onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 12,
      unselectedFontSize: 0.0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Hem',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Historik',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.timeline),
          label: 'Prognos',
        ),
      ],
      backgroundColor: const Color(0xff202020),
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
      currentIndex: _selectedIndex,
      onTap: (chosenIndex) => _onItemTapped(chosenIndex),
    );
  }
}
