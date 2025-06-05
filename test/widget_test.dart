// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:kitaabe/main.dart';

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MyApp());

//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);

//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();

//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitaabe/screens/home/bloc/theme_cubit.dart';
import 'package:kitaabe/screens/splash_screen.dart';

// Mock implementation to avoid Firebase initialization in tests
class MockApp extends StatelessWidget {
  final ThemeCubit themeCubit;

  const MockApp({super.key, required this.themeCubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: themeCubit,
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeMode,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}

void main() {
  late ThemeCubit themeCubit;

  setUp(() {
    themeCubit = ThemeCubit();
  });

  tearDown(() {
    themeCubit.close();
  });

  testWidgets('App initializes with SplashScreen', (WidgetTester tester) async {
    // Build our app with the MockApp to avoid Firebase initialization
    await tester.pumpWidget(MockApp(themeCubit: themeCubit));

    // Verify that the SplashScreen is displayed
    expect(find.byType(SplashScreen), findsOneWidget);
  });
}
