import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitaabe/components/color_extension.dart';
import 'package:kitaabe/components/custom_button.dart';
import 'package:kitaabe/components/custom_text_field.dart';
import 'package:kitaabe/components/text_controllers.dart';
import 'package:kitaabe/screens/auth/sign_in_view.dart';

import '../../services/storage/auth_service.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final textController = TextControllers();

  bool isObsecure = true;
  bool isConfirmObsecure = true;
  bool isAllowTerms = false;
  bool _isSigningIn = false;
  bool _rememberMe = false;
  final AuthService _authService = AuthService();
  User? user;

  Future<void> _handleSignUpEmail(
      String email, String password, bool isAllowTerms) async {
    setState(() => _isSigningIn = true);
    try {
      final emailSignedUpUser =
          await _authService.signUpWithEmailAndPassword(email, password);
      if (emailSignedUpUser != null) {
        _showSuccessSnackBar("signed up successfully");

        setState(() => user = emailSignedUpUser);
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = 'This email is already in use.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is invalid.';
          break;
        case 'operation-not-allowed':
          errorMessage = 'Email/password accounts are not enabled.';
          break;
        case 'weak-password':
          errorMessage = 'The password is too weak.';
          break;
        default:
          errorMessage = 'An unexpected error occurred: ${e.message}';
      }
      _showErrorSnackBar(errorMessage);
    } catch (e) {
      _showErrorSnackBar("Sign-Up error: $e");
    } finally {
      setState(() => _isSigningIn = false);
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.greenAccent,
      ),
    );
  }

  void clearAllField() {
    textController.userNameController.clear();
    textController.emailController.clear();
    textController.passwordController.clear();
    textController.confirmPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final mediaQuery = MediaQuery.of(context).size;
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
                  'Sign up',
                  style: textTheme.titleLarge,
                ),
                const SizedBox(height: 15),
                Opacity(
                  opacity: 0.5,
                  child: SvgPicture.asset(
                    'assets/images/sign_up.svg',
                    placeholderBuilder: (context) =>
                        CircularProgressIndicator(),
                    width: double.infinity,
                    height: mediaQuery.height * 0.3,
                    fit: BoxFit.fill,
                  ),
                ),
                CustomTextField(
                  text: 'Username',
                  controller: textController.userNameController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '* Username is required';
                    }
                    if (value.length < 3) {
                      return '* Username must be at least 3 characters';
                    }
                    return null;
                  },
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
                const SizedBox(height: 15),
                CustomTextField(
                  text: 'Confirm Password',
                  maxlines: 1,
                  isObsecureText: isConfirmObsecure,
                  controller: textController.confirmPasswordController,
                  keyboardType: TextInputType.text,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '* Confirm your password';
                    }
                    if (value != textController.passwordController.text) {
                      return '* Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(
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
                      style: textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  minHeight: 50,
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;

                    if (!isAllowTerms) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('You must accept the terms and conditions'),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      return;
                    }

                    _handleSignUpEmail(
                      textController.emailController.text,
                      textController.passwordController.text,
                      isAllowTerms,
                    );
                    clearAllField();
                  },
                  boxDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: TColor.primary,
                  ),
                  child: Center(
                    child: Text(
                      "Sign up",
                      style: textTheme.labelMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignInView(),
                        ),
                      );
                    },
                    child: Text(
                      'Already have an account ?, Sign In',
                      style: textTheme.bodySmall?.copyWith(
                        color: TColor.primary,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
