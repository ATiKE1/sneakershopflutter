import 'package:flutter/material.dart';
import '../styles/color_palette.dart' as palette;

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final List<OnboardingData> pages = [
    OnboardingData(
      'https://i.imgur.com/XmFHUX0.png',
      'ДОБРО\nПОЖАЛОВАТЬ',
      '',
    ),
    OnboardingData(
      'https://i.imgur.com/lpTsbEV.png',
      'Начнем\nпутешествие',
      'Умная, великолепная и модная коллекция\nИзучите сейчас',
    ),
    OnboardingData(
      'https://i.imgur.com/nCGQlLd.png',
      'У Вас Есть Сила,\nЧтобы',
      'В вашей комнате много красивых и\nпривлекательных растений',
    ),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        width: cWidth,
        //width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF48B2E7),
              Color(0xFF44A9DC),
              Color(0xFF2B6B8B),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const Spacer(),
                if (pages[currentPage].description.isEmpty) ...[
                  Text(
                    pages[currentPage].title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
                Image.network(
                  pages[currentPage].imageUrl,
                  height: 375,
                ),
                if (pages[currentPage].description.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text(
                    pages[currentPage].title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    pages[currentPage].description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: palette.subTextLight,
                    ),
                  ),
                ],
                const SizedBox(height: 48),
                PageIndicator(
                  count: pages.length,
                  currentPage: currentPage,
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      if (currentPage < pages.length - 1) {
                        setState(() {
                          currentPage++;
                        });
                      } else {
                        Navigator.pushReplacementNamed(context, '/home');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      currentPage == 0 ? 'Начать' : 'Далее',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardingData {
  final String imageUrl;
  final String title;
  final String description;

  OnboardingData(this.imageUrl, this.title, this.description);
}

class PageIndicator extends StatelessWidget {
  final int count;
  final int currentPage;

  const PageIndicator({
    super.key,
    required this.count,
    required this.currentPage,
  });

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
            borderRadius: BorderRadius.circular(3),
            color: currentPage == index ? Colors.white : palette.disable,
          ),
        ),
      ),
    );
  }
}
