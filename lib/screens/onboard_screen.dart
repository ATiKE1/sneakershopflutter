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
    return Scaffold(
      body: Container(
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
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.06),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    if (pages[currentPage].description.isEmpty) ...[
                      Expanded(
                        flex: 2,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            pages[currentPage].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 34,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                    Expanded(
                      flex: 5,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.network(
                          pages[currentPage].imageUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    if (pages[currentPage].description.isNotEmpty) ...[
                      Expanded(
                        flex: 2,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            pages[currentPage].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 34,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            pages[currentPage].description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              color: palette.subTextLight,
                            ),
                          ),
                        ),
                      ),
                    ],
                    Expanded(
                      flex: 1,
                      child: PageIndicator(
                        count: pages.length,
                        currentPage: currentPage,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: constraints.maxHeight * 0.07,
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
                    SizedBox(height: constraints.maxHeight * 0.04),
                  ],
                ),
              );
            },
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
