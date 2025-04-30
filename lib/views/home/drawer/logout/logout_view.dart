import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/views/auth/welcome_view.dart';
import 'package:kitaabe/views/home/main_tab_bar.dart';

class LogoutView extends StatelessWidget {
  const LogoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const MainTabBar(),
              ),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        elevation: 0,
        title: Text(
          'Log Out',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: TColor.text,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 160),
        decoration: BoxDecoration(
          color: TColor.primaryLight,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(12),
        width: 400,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              'Do you wanna log out from this account ?',
              style: GoogleFonts.poppins(
                color: TColor.text,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 2),
                    color: Colors.redAccent[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const MainTabBar(),
                      ));
                    },
                    child: Text(
                      'NO',
                      style: GoogleFonts.poppins(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent[100],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: TColor.primary,
                      width: 2,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const WelcomeView(),
                        ),
                      );
                    },
                    child: Text(
                      'YES',
                      style: GoogleFonts.poppins(
                        color: TColor.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
