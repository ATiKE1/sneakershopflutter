import 'package:flutter/material.dart';
import '../styles/color_palette.dart' as palette;
import '../styles/images.dart' as img;

Widget buildSearchBar() {
  return Row(
    children: <Widget>[
      Expanded(
        child: SearchBar(
          backgroundColor: WidgetStateProperty.all(Colors.white),
          shape: WidgetStateProperty.all(const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
          )),
          leading: const Icon(Icons.search, color: palette.subTextDark),
          hintText: 'Поиск',
          constraints: const BoxConstraints(
            minHeight: 52,
            maxHeight: 52,
          ),
        ),
      ),
      const SizedBox(width: 14),
      Image.network(img.searchfilter),
    ],
  );
}
