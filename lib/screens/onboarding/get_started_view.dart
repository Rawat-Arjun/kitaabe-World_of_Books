import 'package:flutter/material.dart';
import 'package:kitaabe/components/color_extension.dart';
import 'package:kitaabe/components/custom_button.dart';
import 'package:kitaabe/screens/auth/welcome_view.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.4,
            child: Image.asset(
              'assets/images/book_wallpaper.jpg',
              height: mediaQuery.height,
              width: mediaQuery.width,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: CustomButton(
              minWidth: 200,
              minHeight: 70,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const WelcomeView(),
                  ),
                );
              },
              boxDecoration: BoxDecoration(
                color: TColor.primary,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  "Let's dive into Kitaabe",
                  style: textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
