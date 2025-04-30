import 'package:flutter/material.dart';
import 'package:kitaabe/views/onboarding/get_started_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpStorageService {
  static const String onboardingKey = 'seen_onboarding';
  static const String darkModeKey = 'dark_mode';

  static Future<bool> hasSeenOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(onboardingKey) ?? false;
  }

  static Future<void> setOnboardingSeen(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(onboardingKey, true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => GetStartedView()),
    );
  }

  static Future<bool> hasDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(darkModeKey) ?? false;
  }

  static Future<void> setDarkMode(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(darkModeKey, isDark);
  }
}
