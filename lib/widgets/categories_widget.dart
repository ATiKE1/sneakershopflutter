import 'package:flutter/material.dart';
import '../styles/color_palette.dart' as palette;
import '../data/lists.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  List<String> categoryTitles = [];

  @override
  void initState() {
    super.initState();
    categoryTitles = List.from(categories.map((c) => c.categoryTitle));
  }

  @override
  Widget build(BuildContext context) {
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
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final categoryIndex = index % categories.length;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    categoryTitles[categoryIndex] =
                        '${categoryTitles[categoryIndex]} $categoryIndex';
                  });
                },
                child: Container(
                  width: 108,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: palette.block,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      categoryTitles[categoryIndex],
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
