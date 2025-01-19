import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/common/custom_button.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isStaySignin = false;
  bool isSigninButtonPressed = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign in',
                  style: GoogleFonts.poppins(
                    color: TColor.text,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: emailController,
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
                SizedBox(height: 15),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    hintText: 'Password',
                    hintStyle: GoogleFonts.poppins(fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: TColor.primary,
                      value: isStaySignin,
                      onChanged: (value) {
                        setState(() {
                          isStaySignin = value!;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Stay Logged In',
                      style: GoogleFonts.poppins(
                        color: TColor.primaryLight,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Your Password?',
                        style: GoogleFonts.poppins(
                          color: TColor.primaryLight,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  minWidth: double.infinity,
                  minHeight: media.height * 0.05,
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      isSigninButtonPressed = true;
                    });

                    await Future.delayed(
                      Duration(seconds: 1),
                    );
                    setState(() {
                      isSigninButtonPressed = false;
                    });
                  },
                  boxDecoration: BoxDecoration(
                    color: isSigninButtonPressed == false
                        ? Colors.white
                        : TColor.primary,
                    border: Border.all(
                      color: TColor.primary,
                    ),
                    boxShadow: [
                      isSigninButtonPressed == false
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
                      'Sign in',
                      style: GoogleFonts.poppins(
                        color: isSigninButtonPressed == false
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
