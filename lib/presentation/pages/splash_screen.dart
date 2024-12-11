import 'package:flutter/material.dart';
import 'main_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset(
        'assets/animation/splash.json',
      ),
      nextScreen: MainPage(),
      duration: 3000,
    );
  }
}
