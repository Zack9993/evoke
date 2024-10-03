import 'package:flutter/material.dart';
import 'package:flutter_page_indicator_tv/flutter_page_indicator.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  List<String> onboardingTexts = [
    "Welcome to the Gallery App!",
    "Explore beautiful images.",
    "Enjoy the experience!",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {});
              },
              itemCount: onboardingTexts.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Text(
                    onboardingTexts[index],
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          ),
          PageIndicator(
            layout: PageIndicatorLayout.SLIDE,
            size: 8.0,
            controller: _controller,
            count: onboardingTexts.length,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: Text('Get Started'),
          ),
        ],
      ),
    );
  }
}
