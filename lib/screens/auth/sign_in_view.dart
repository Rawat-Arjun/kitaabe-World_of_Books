import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitaabe/components/color_extension.dart';
import 'package:kitaabe/components/custom_button.dart';
import 'package:kitaabe/components/custom_text_field.dart';
import 'package:kitaabe/components/text_controllers.dart';
import 'package:kitaabe/screens/auth/forgot_password_view.dart';
import 'package:kitaabe/screens/auth/sign_up_view.dart';

import '../../services/storage/auth_service.dart';
import '../home/ui/main_tab_bar.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  final textController = TextControllers();

  bool isObsecure = true;
  bool isSigninButtonPressed = false;

  bool _isSigningIn = false;
  bool _rememberMe = false;
  final AuthService _authService = AuthService();
  User? user;

  Future<void> _handleSignInEmail(
      String email, String password, bool isRememberMe) async {
    setState(() => _isSigningIn = true);
    try {
      final emailSignedInUser =
          await _authService.signInWithEmailAndPassword(email, password);
      if (emailSignedInUser != null) {
        print("User signed in: ${emailSignedInUser.displayName}");
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const MainTabBar(),
          ),
        );

        setState(() => user = emailSignedInUser);
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found with this email.';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password. Please try again.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is not valid.';
          break;
        case 'user-disabled':
          errorMessage = 'This user account has been disabled.';
          break;
        default:
          errorMessage = 'An unexpected error occurred: ${e.message}';
      }
    } catch (e) {
      print("Sign-in error: $e");
      _showSnackBar("Sign-in error: $e");
    } finally {
      setState(() => _isSigningIn = false);
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
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
                  style: textTheme.titleLarge,
                ),
                const SizedBox(height: 15),
                Opacity(
                  opacity: 0.5,
                  child: SvgPicture.asset(
                    'assets/images/sign_in.svg',
                    placeholderBuilder: (context) =>
                        CircularProgressIndicator(),
                    width: double.infinity,
                    height: mediaQuery.height * 0.3,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  text: 'Email Address',
                  controller: textController.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '* Email Address is required';
                    }
                    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                    if (!emailRegex.hasMatch(value)) {
                      return '* Enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  text: 'Password',
                  maxlines: 1,
                  isObsecureText: isObsecure,
                  controller: textController.passwordController,
                  keyboardType: TextInputType.text,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '* Password is required';
                    }
                    if (value.length < 6) {
                      return '* Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Checkbox(
                      side: const BorderSide(color: Colors.grey),
                      activeColor: TColor.primary,
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value!;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Text(
                      'Remember Me',
                      style: textTheme.bodySmall,
                    ),
                    const Spacer(),
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
                        style: textTheme.bodySmall
                            ?.copyWith(color: TColor.primary),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  minHeight: 50,
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;

                    _handleSignInEmail(
                      textController.emailController.text,
                      textController.passwordController.text,
                      _rememberMe,
                    );
                  },
                  boxDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: TColor.primary,
                  ),
                  child: Center(
                    child: Text(
                      "Sign in",
                      style: textTheme.labelMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignUpView(),
                        ),
                      );
                    },
                    child: Text(
                      "Don't have an account ?, Sign Up",
                      style: textTheme.bodySmall?.copyWith(
                        color: TColor.primary,
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
