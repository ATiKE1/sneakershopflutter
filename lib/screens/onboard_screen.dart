import 'package:flutter/material.dart';
import '../styles/color_palette.dart' as pallete;

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final List<LoaderQueue> queue = [
    LoaderQueue('https://i.imgur.com/XmFHUX0.png', 'ДОБРО ПОЖАЛОВАТЬ', ''),
    LoaderQueue('https://i.imgur.com/lpTsbEV.png', 'Начнем путешествие',
        'Умная, великолепная и модная коллекция Изучите сейчас'),
    LoaderQueue('https://i.imgur.com/nCGQlLd.png', 'У Вас Есть Сила, Чтобы',
        'В вашей комнате много красивых и привлекательных растений'),
  ];

  int currentIndex = 0;
  bool isFirstPage = true;

  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(16.0),
      width: cWidth,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color(0xFF48B2E7),
            Color(0xFF44A9DC),
            Color(0xFF2B6B8B)
          ])),
      child: Center(
          child: isFirstPage
              ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Flexible(
                      child: Text(
                    queue[currentIndex].header,
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  )),
                  const SizedBox(height: 130),
                  Image.network(queue[currentIndex].imgLink),
                  const SizedBox(height: 26),
                  PageIndicators(
                    count: queue.length,
                    currentPage: currentIndex,
                  ),
                  const SizedBox(height: 130),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 160),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (currentIndex != queue.length - 1) {
                          currentIndex++;
                          isFirstPage = false;
                        }
                      });
                    },
                    child: const Text(
                      'Начать',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ])
              : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.network(queue[currentIndex].imgLink),
                  const SizedBox(height: 60),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      queue[currentIndex].header,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 34, color: Colors.white),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      queue[currentIndex].description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16, color: pallete.subTextLight),
                    ),
                  ),
                  const SizedBox(height: 40),
                  PageIndicators(
                    count: queue.length,
                    currentPage: currentIndex,
                  ),
                  const SizedBox(height: 130),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 160),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (currentIndex != queue.length - 1) {
                          currentIndex++;
                        } else {
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      });
                    },
                    child: const Text(
                      'Далее',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ])),
    ));
  }
}

class LoaderQueue {
  final String imgLink;
  final String header;
  final String description;

  LoaderQueue(this.imgLink, this.header, this.description);
}

class PageIndicators extends StatelessWidget {
  final int count;
  final int currentPage;

  const PageIndicators(
      {super.key, required this.count, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 43,
          height: 5,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: currentPage == index ? Colors.white : pallete.disable,
          ),
        ),
      ),
    );
  }
}
