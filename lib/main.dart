import 'package:flutter/material.dart';
import 'package:sneaker_shop/screens/home_screen.dart';
import 'package:sneaker_shop/screens/login_screen.dart';
import 'package:sneaker_shop/screens/onboard_screen.dart';
import './styles/color_palette.dart' as palette;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MATULEme',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: palette.background),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/onboard': (context) => const OnBoardScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        width: cWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: () =>
                    {Navigator.pushReplacementNamed(context, '/onboard')},
                child: const Text('OnBoard')),
            TextButton(
                onPressed: () =>
                    {Navigator.pushReplacementNamed(context, '/login')},
                child: const Text('Log In')),
          ],
        ),
      ),
    );
  }
}
