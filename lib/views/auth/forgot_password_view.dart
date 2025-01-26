import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/common/color_extension.dart';

import '../../common/custom_button.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  bool isButtonPressed = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forgot Password',
                  style: GoogleFonts.poppins(
                    color: TColor.text,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: media.height * 0.05,
                ),
                Opacity(
                  opacity: 0.5,
                  child: SvgPicture.asset(
                    'assets/images/forgot_password.svg',
                    placeholderBuilder: (context) =>
                        CircularProgressIndicator(),
                    width: double.infinity,
                    height: media.height * 0.3,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  controller: emailController,
                  cursorColor: TColor.primary,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    hintText: 'Email Address',
                    hintStyle: GoogleFonts.poppins(fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomButton(
                  minWidth: double.infinity,
                  minHeight: media.height * 0.05,
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      isButtonPressed = true;
                    });

                    await Future.delayed(
                      Duration(seconds: 1),
                    );
                    setState(() {
                      isButtonPressed = false;
                    });
                  },
                  boxDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: isButtonPressed == false
                        ? Colors.white
                        : TColor.primary,
                    border: Border.all(
                      color: TColor.primary,
                    ),
                    boxShadow: [
                      isButtonPressed == false
                          ? BoxShadow()
                          : BoxShadow(
                              color: Color.fromRGBO(33, 33, 33, 0.5),
                              spreadRadius: 2,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: GoogleFonts.poppins(
                        color: isButtonPressed == false
                            ? TColor.primary
                            : Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
