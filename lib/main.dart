import 'package:flutter/material.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/service/sp_storage_service.dart';
import 'package:kitaabe/views/splash_sreen.dart';

final themeModeNotifier = ValueNotifier<ThemeMode>(ThemeMode.system);
void toggleTheme(bool isDark) async {
  themeModeNotifier.value = isDark ? ThemeMode.dark : ThemeMode.light;
  await SpStorageService.setDarkMode(isDark);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isDark = await SpStorageService.hasDarkMode();
  themeModeNotifier.value = isDark ? ThemeMode.dark : ThemeMode.light;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (context, currentMode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Kitaabe - World of Books',
          themeMode: currentMode,
          theme: ThemeData(
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
          ),
          darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Color(0xFF121212),
            cardColor: Color(0xFF1E1E1E),
            textTheme: TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white70),
            ),
            colorScheme: ColorScheme.dark(
              primary: Colors.tealAccent,
              secondary: Colors.cyanAccent,
            ),
          ),
          home: SplashSreen(),
        );
      },
    );
  }
}
 // brightness: Brightness.dark,
            // scaffoldBackgroundColor: Colors.grey[900],
            // colorScheme: ColorScheme.fromSeed(
            //   seedColor: TColor.primary,
            //   brightness: Brightness.dark,
            // ),