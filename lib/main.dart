import 'package:flutter/material.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/views/home/drawer/help/contact%20us/contact_us_view.dart';
import 'package:kitaabe/views/home/drawer/help/terms%20and%20policies/terms_and_policies_view.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: TColor.primary,
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: TColor.primary,
              width: 2,
            ),
          ),
          suffixIconColor: TColor.primary,
          prefixIconColor: TColor.primary,
        ),
      ),
      home: const TermsAndPoliciesView(),
    );
  }
}
