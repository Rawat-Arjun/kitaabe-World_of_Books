import 'package:flutter/material.dart';
import 'package:kitaabe/common/color_extension.dart';
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
      title: 'Kitaabe-World_of_Books',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: TColor.primary,
        ),
        inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: TColor.primary,
                width: 2,
              ),
            ),
            suffixIconColor: TColor.primary),
      ),
      home: const OnboardingView(),
    );
  }
}
