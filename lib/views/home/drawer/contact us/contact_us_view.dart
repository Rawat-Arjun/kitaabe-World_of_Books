import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/common/custom_button.dart';

import '../../main_tab_bar.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  late final TextEditingController emailController;
  late final TextEditingController messageController;

  @override
  void initState() {
    emailController = TextEditingController();
    messageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

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
          'Contact Us',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: TColor.text,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            TextFormField(
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              cursorColor: TColor.primary,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: TColor.primary,
                    width: 2,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                hintText: 'Email Address',
                hintStyle: GoogleFonts.poppins(fontSize: 15),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              maxLines: 5,
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              cursorColor: TColor.primary,
              controller: messageController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: TColor.primary,
                    width: 2,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                hintText: 'Message',
                hintStyle: GoogleFonts.poppins(fontSize: 15),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(
              onPressed: () {
                emailController.text = '';
                messageController.text = '';
                Future.delayed(
                  Duration(
                    seconds: 2,
                  ),
                  () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text('Message submitted successfully !')));
                  },
                );
              },
              minHeight: 50,
              minWidth: 200,
              boxDecoration: BoxDecoration(
                color: TColor.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'Submit',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
