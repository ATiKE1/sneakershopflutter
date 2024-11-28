import 'package:flutter/material.dart';
import '../styles/color_palette.dart' as pallete;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  final emailInputController = TextEditingController();
  final passwordInputController = TextEditingController();

  @override
  void dispose() {
    emailInputController.dispose();
    passwordInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(16.0),
        width: cWidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Text(
                      'Привет!',
                      style: TextStyle(
                        fontSize: 32,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Заполните Свои Данные Или\nПродолжите Через Социальные Медиа',
                      style: TextStyle(
                        fontSize: 16,
                        color: pallete.subTextDark,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Email',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: emailInputController,
                decoration: InputDecoration(
                  hintText: 'xyz@gmail.com',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Пароль',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              TextField(
                obscureText: _obscureText,
                controller: passwordInputController,
                decoration: InputDecoration(
                  hintText: '********',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: const Text(
                    'Восстановить',
                    style: TextStyle(color: pallete.subTextDark, fontSize: 14),
                  ),
                  onTap: () {
                    // Handle create user
                  },
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: pallete.accent,
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(emailInputController.text) &&
                      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                          .hasMatch(passwordInputController.text)) {
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                },
                child: const Text(
                  'Войти',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Вы впервые? ',
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  ),
                  GestureDetector(
                    child: const Text(
                      'Создать пользователя',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    onTap: () {
                      // Handle create user
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
