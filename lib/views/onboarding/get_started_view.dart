import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/common/custom_button.dart';
import 'package:kitaabe/views/auth/welcome_view.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CustomButton(
          minWidth: media.width * 0.6,
          minHeight: media.height * 0.1,
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
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              "Let's dive into Kittabe",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
}
