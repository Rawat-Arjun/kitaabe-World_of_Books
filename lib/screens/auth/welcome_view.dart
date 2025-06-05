import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kitaabe/services/storage/auth_service.dart';
import 'package:kitaabe/screens/auth/sign_in_view.dart';
import 'package:kitaabe/screens/auth/sign_up_view.dart';
import '../../components/color_extension.dart';
import '../../components/custom_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../home/ui/main_tab_bar.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  bool _isSigningIn = false;
  final bool _rememberMe = false;
  final AuthService _authService = AuthService();
  User? user;
  // Method to handle the Google Sign-In process
  Future<void> _handleSignInGoogle() async {
    setState(() => _isSigningIn = true);
    try {
      final googleSignedInUser = await _authService.signInWithGoogle(
        rememberMe: _rememberMe,
      );
      if (googleSignedInUser != null) {
        log("User signed in: ${googleSignedInUser.displayName}");
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const MainTabBar(),
          ),
        );
        setState(() => user = googleSignedInUser);
      } else {
        log("Sign-in failed");
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const WelcomeView(),
        ));
      }
    } catch (e) {
      log("Sign-in error: $e");
    } finally {
      setState(() => _isSigningIn = false);
    }
  }

  // Method to check if the user is already signed in
  Future<void> _checkIfUserIsSignedIn() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      user = currentUser;
    }
  }

  @override
  void initState() {
    super.initState();
    _checkIfUserIsSignedIn(); // Check if the user is signed in when the view is loaded
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    if (user != null) {
      return MainTabBar();
    }
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: mediaQuery.width,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 40,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Column(
                children: [
                  Text(
                    "Books for\nEvery Taste",
                    textAlign: TextAlign.center,
                    style: textTheme.headlineLarge,
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.05,
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
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Sign in with Email',
                        style: textTheme.titleMedium
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
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
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Sign up with Email',
                        style: textTheme.titleMedium
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: const Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'OR',
                        style: textTheme.bodySmall,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: const Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  _isSigningIn
                      ? CustomButton(
                          minWidth: double.maxFinite,
                          minHeight: 50,
                          onPressed: () {},
                          boxDecoration: BoxDecoration(
                            color: TColor.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : user == null
                          ? CustomButton(
                              minWidth: double.maxFinite,
                              minHeight: 50,
                              onPressed: _handleSignInGoogle,
                              boxDecoration: BoxDecoration(
                                color: TColor.primary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.network(
                                    'https://upload.wikimedia.org/wikipedia/commons/c/c1/Google_%22G%22_logo.svg',
                                    placeholderBuilder: (context) =>
                                        const CircularProgressIndicator(),
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.fill,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Continue with Google',
                                    style: textTheme.titleMedium?.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox(),
                  const Spacer(),
                  Opacity(
                    opacity: 0.5,
                    child: SvgPicture.asset(
                      'assets/images/welcome.svg',
                      placeholderBuilder: (context) =>
                          const CircularProgressIndicator(),
                      width: double.infinity,
                      height: mediaQuery.height * 0.35,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
