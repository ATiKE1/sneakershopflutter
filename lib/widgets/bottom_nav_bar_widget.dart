import 'package:flutter/material.dart';

Widget buildBottomNavBar() {
  return BottomNavigationBar(items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
    BottomNavigationBarItem(icon: Icon(Icons.clean_hands), label: 'Nono')
  ]);
}
