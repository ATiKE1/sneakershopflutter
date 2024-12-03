import 'package:flutter/material.dart';
import '../widgets/search_widget.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/categories_widget.dart';
import '../widgets/bottom_nav_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      bottomNavigationBar: buildBottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildSearchBar(),
                const SizedBox(height: 20),
                const CategoriesWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
