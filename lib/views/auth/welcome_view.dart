import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/common/custom_button.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: media.width,
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            child: Column(
              children: [
                Text(
                  "Books For\nEveryone's Taste",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: TColor.primary,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.height * 0.20,
                ),
                CustomButton(
                  minWidth: double.maxFinite,
                  minHeight: 50,
                  onPressed: () {},
                  color: TColor.primary,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                  child: Center(
                    child: Text(
                      'Sign in',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  minWidth: double.maxFinite,
                  minHeight: 50,
                  onPressed: () {},
                  color: TColor.primary,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                  child: Center(
                    child: Text(
                      'Sign up',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: media.height * 0.1,
                ),
                Opacity(
                  opacity: 0.5,
                  child: SvgPicture.asset(
                    'assets/images/on_3.svg',
                    placeholderBuilder: (context) =>
                        CircularProgressIndicator(),
                    width: double.infinity,
                    height: media.height * 0.4,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
