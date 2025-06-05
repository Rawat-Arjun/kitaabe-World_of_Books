import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/util/storage/sp_storage_service.dart';
import 'package:kitaabe/views/auth/welcome_view.dart';
import 'package:kitaabe/views/onboarding/onboarding_view.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 3), () async {
      final hasSeenOnboarding = await SpStorageService.hasSeenOnboarding();
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              hasSeenOnboarding ? const WelcomeView() : const OnboardingView(),
        ),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: TColor.primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/animations/book.json',
              ),
              Text(
                'Kitaabe - \nWorld of Books',
                textAlign: TextAlign.center,
                style: textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Text(
                'Made by Mr_Flutter 💕',
                style: textTheme.labelMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
