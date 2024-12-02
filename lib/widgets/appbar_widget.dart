import 'package:flutter/material.dart';
import '../styles/images.dart' as img;

bool cartNull = false;

AppBar buildAppBar() {
  return AppBar(
    title: const Text(
      'Главная',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    ),
    centerTitle: true,
    leading: GestureDetector(
      onTap: () => {
        // hamburger tap action
      },
      child: Image.network(img.hamburger),
    ),
    actions: [
      Stack(
        children: [
          GestureDetector(
            onTap: () {
              // on cart tap action
            },
            child: Image.network(
              img.cart,
              width: 64,
              height: 64,
            ),
          ),
          if (!cartNull)
            Positioned(
              right: 11,
              top: 11,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(
                  minWidth: 8,
                  minHeight: 8,
                ),
              ),
            ),
        ],
      ),
      const SizedBox(width: 5)
    ],
    backgroundColor: Colors.white,
  );
}
