import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitaabe/components/color_extension.dart';
import 'package:kitaabe/screens/home/bloc/theme_cubit.dart';
import 'package:kitaabe/screens/home/ui/drawer/favourite/bloc/favourite_cubit.dart';
import 'package:kitaabe/screens/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  WebViewPlatform.instance = AndroidWebViewPlatform();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => FavouriteCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Kitaabe',
            theme: _lightTheme(),
            darkTheme: _darkTheme(),
            themeMode: themeMode,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }

  ThemeData _lightTheme() {
    return ThemeData(
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.poppins(
            fontSize: 28, fontWeight: FontWeight.bold, color: TColor.primary),
        titleLarge: GoogleFonts.poppins(
            fontSize: 22, fontWeight: FontWeight.bold, color: TColor.text),
        labelMedium: GoogleFonts.poppins(
            fontSize: 14, fontWeight: FontWeight.bold, color: TColor.text),
        labelSmall: GoogleFonts.poppins(fontSize: 12, color: TColor.text),
        titleMedium: GoogleFonts.poppins(fontSize: 20, color: TColor.text),
        bodySmall: GoogleFonts.poppins(fontSize: 14, color: TColor.text),
        bodyMedium: GoogleFonts.poppins(fontSize: 16, color: TColor.text),
      ),
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(seedColor: TColor.primary),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: TColor.primary, width: 2),
        ),
        suffixIconColor: TColor.primary,
        prefixIconColor: TColor.primary,
      ),
    );
  }

  ThemeData _darkTheme() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color(0xFF181818),
      primaryColor: Colors.white70,
      colorScheme: ColorScheme.dark(
        primary: TColor.primary,
        surface: const Color(0xFF181818),
        onSurface: Colors.white60,
      ),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.poppins(
            fontSize: 28, fontWeight: FontWeight.bold, color: TColor.primary),
        titleLarge: GoogleFonts.poppins(
            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        labelMedium: GoogleFonts.poppins(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
        labelSmall: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
        titleMedium: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
        bodySmall: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
        bodyMedium: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
