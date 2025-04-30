import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/common/custom_button.dart';
import 'package:kitaabe/views/auth/sign_in_view.dart';
import 'package:kitaabe/views/auth/sign_up_view.dart';
import 'package:kitaabe/views/home/main_tab_bar.dart';

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
              vertical: 40,
            ),
            child: Column(
              children: [
                Text(
                  "Books for\nEvery Taste",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: TColor.primary,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.height * 0.05,
                ),
                CustomButton(
                  minWidth: double.maxFinite,
                  minHeight: 50,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignInView(),
                      ),
                    );
                  },
                  boxDecoration: BoxDecoration(
                    color: TColor.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      'Sign in with Email',
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
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignUpView(),
                      ),
                    );
                  },
                  boxDecoration: BoxDecoration(
                    color: TColor.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      'Sign up with Email',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'OR',
                      style: GoogleFonts.poppins(color: TColor.primaryLight),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                CustomButton(
                  minWidth: double.maxFinite,
                  minHeight: 50,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => MainTabBar(),
                    ));
                  },
                  boxDecoration: BoxDecoration(
                    color: TColor.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.network(
                        'https://upload.wikimedia.org/wikipedia/commons/c/c1/Google_%22G%22_logo.svg',
                        placeholderBuilder: (context) =>
                            CircularProgressIndicator(),
                        width: double.infinity,
                        height: 20,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Continue with Google',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 15),
                Spacer(),
                Opacity(
                  opacity: 0.5,
                  child: SvgPicture.asset(
                    'assets/images/welcome.svg',
                    placeholderBuilder: (context) =>
                        CircularProgressIndicator(),
                    width: double.infinity,
                    height: media.height * 0.35,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
