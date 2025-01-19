import 'package:flutter/material.dart';
import 'package:kitaabe/views/onboarding/onboarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kitaabe',
      home: OnboardingView(),
    );
  }
}
