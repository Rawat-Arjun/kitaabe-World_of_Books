import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/views/home/drawer/help/contact%20us/contact_us_view.dart';
import 'package:kitaabe/views/home/drawer/help/terms%20and%20policies/terms_and_policies_view.dart';
import 'package:kitaabe/views/home/main_tab_bar.dart';
import 'package:kitaabe/views/onboarding/onboarding_view.dart';
import 'package:kitaabe/util/storage/sp_storage_service.dart';
import 'package:kitaabe/views/splash_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

import 'firebase_options.dart';
import 'util/storage/theme_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final isDark = await SpStorageService.hasDarkMode();
  themeModeNotifier.value = isDark ? ThemeMode.dark : ThemeMode.light;

  WebViewPlatform.instance = AndroidWebViewPlatform();

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
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: TColor.primary,
                width: 2,
              ),
            ),
            suffixIconColor: TColor.primary),
      ),
      home: const TermsAndPoliciesView(),
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (context, currentMode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Kitaabe',
          themeMode: currentMode,
          theme: ThemeData(
            textTheme: TextTheme(
              headlineLarge: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: TColor.primary,
              ),
              titleLarge: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: TColor.text,
              ),
              labelMedium: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: TColor.text,
              ),
              labelSmall: GoogleFonts.poppins(
                fontSize: 12,
                color: TColor.text,
              ),
              titleMedium: GoogleFonts.poppins(
                fontSize: 20,
                color: TColor.text,
              ),
              bodySmall: GoogleFonts.poppins(
                fontSize: 14,
                color: TColor.text,
              ),
              bodyMedium: GoogleFonts.poppins(
                fontSize: 16,
                color: TColor.text,
              ),
            ),
            brightness: Brightness.light,
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
          darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Color(0xFF181818),
            primaryColor: Colors.white70,
            colorScheme: ColorScheme.dark(
              primary: TColor.primary,
              surface: Color(0xFF181818),
              onSurface: Colors.white60,
            ),
            textTheme: TextTheme(
              headlineLarge: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: TColor.primary,
              ),
              titleLarge: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              labelMedium: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              labelSmall: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.white,
              ),
              titleMedium: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.white,
              ),
              bodySmall: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.white,
              ),
              bodyMedium: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          home: const SplashScreen(),
        );
      },

    );
  }
}
