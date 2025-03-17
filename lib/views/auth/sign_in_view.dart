import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/common/custom_button.dart';
import 'package:kitaabe/views/auth/forgot_password_view.dart';
import 'package:kitaabe/views/home/home_view.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObsecure = true;
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
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 40,
            ),
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
                Opacity(
                  opacity: 0.5,
                  child: SvgPicture.asset(
                    'assets/images/sign_in.svg',
                    placeholderBuilder: (context) =>
                        CircularProgressIndicator(),
                    width: double.infinity,
                    height: media.height * 0.3,
                    fit: BoxFit.fill,
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
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Checkbox(
                      side: BorderSide(color: Colors.grey),
                      activeColor: TColor.primary,
                      value: isStaySignin,
                      onChanged: (value) {
                        setState(() {
                          isStaySignin = value!;
                        });
                      },
                    ),
                    SizedBox(width: 1),
                    Text(
                      'Stay Logged In',
                      style: GoogleFonts.poppins(
                        color: TColor.primaryLight,
                        fontSize: 15,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordView(),
                          ),
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.poppins(
                          color: TColor.primaryLight,
                          fontSize: 15,
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
                    if (mounted) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomeView(),
                        ),
                      );
                    }
                    await Future.delayed(
                      Duration(seconds: 1),
                    );
                    setState(() {
                      isSigninButtonPressed = false;
                    });
                  },
                  boxDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
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
