import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/service/sp_storage_service.dart';
import 'package:kitaabe/views/auth/welcome_view.dart';
import 'package:kitaabe/views/onboarding/onboarding_view.dart';
import 'package:lottie/lottie.dart';

class SplashSreen extends StatefulWidget {
  const SplashSreen({super.key});

  @override
  State<SplashSreen> createState() => _SplashSreenState();
}

class _SplashSreenState extends State<SplashSreen> {
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
              hasSeenOnboarding ? WelcomeView() : OnboardingView(),
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
    return Scaffold(
      backgroundColor: TColor.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/book.json',
            ),
            Text(
              'Kitaabe - \nWorld of Books',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Spacer(),
            Text(
              'Made by Mr_Flutter 💕',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
