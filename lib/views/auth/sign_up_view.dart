import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/common/custom_button.dart';
import 'package:kitaabe/views/auth/sign_in_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isObsecure = true;
  bool isConfirmObsecure = true;
  bool isAllowTerms = false;
  bool isSignUpButtonPressed = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign up',
                  style: GoogleFonts.poppins(
                    color: TColor.text,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  cursorColor: TColor.primary,
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: TColor.primary,
                        width: 2,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    hintText: 'Username',
                    hintStyle: GoogleFonts.poppins(fontSize: 15),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  cursorColor: TColor.primary,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: TColor.primary,
                        width: 2,
                      ),
                    ),
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
                TextFormField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  cursorColor: TColor.primary,
                  controller: passwordController,
                  obscureText: isObsecure,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: TColor.primary,
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    hintText: 'Password',
                    hintStyle: GoogleFonts.poppins(fontSize: 15),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObsecure = !isObsecure;
                        });
                      },
                      icon: Icon(
                        isObsecure == true
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  cursorColor: TColor.primary,
                  controller: confirmPasswordController,
                  obscureText: isConfirmObsecure,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: TColor.primary,
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    hintText: 'Confirm Password',
                    hintStyle: GoogleFonts.poppins(fontSize: 15),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isConfirmObsecure = !isConfirmObsecure;
                        });
                      },
                      icon: Icon(
                        isConfirmObsecure == true
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: TColor.primary,
                      value: isAllowTerms,
                      onChanged: (value) {
                        setState(() {
                          isAllowTerms = value!;
                        });
                      },
                    ),
                    Text(
                      'I agree to the terms and conditions',
                      style: GoogleFonts.poppins(
                        color: TColor.primaryLight,
                      ),
                    ),
                  ],
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
                      isSignUpButtonPressed = true;
                    });
                    if (mounted) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignInView(),
                        ),
                      );
                    }
                    await Future.delayed(
                      Duration(seconds: 1),
                    );
                    setState(() {
                      isSignUpButtonPressed = false;
                    });
                  },
                  boxDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: isSignUpButtonPressed == false
                        ? Colors.white
                        : TColor.primary,
                    border: Border.all(
                      color: TColor.primary,
                    ),
                    boxShadow: [
                      isSignUpButtonPressed == false
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
                      'Sign up',
                      style: GoogleFonts.poppins(
                        color: isSignUpButtonPressed == false
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
