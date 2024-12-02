import 'package:flutter/material.dart';
import '../styles/color_palette.dart' as palette;
import '../data/lists.dart';

Widget buildCategories() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Категории',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 40,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              categories.length,
              (index) => Container(
                width: 108,
                margin: EdgeInsets.only(
                  right: index == categories.length - 1 ? 0 : 10,
                ),
                decoration: BoxDecoration(
                  color: palette.block,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    categories[index].categoryTitle,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
