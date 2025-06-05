import 'package:flutter/material.dart';
import 'package:kitaabe/components/color_extension.dart';
import 'storage/auth_service.dart';

class ForgotPasswordController {
  final TextEditingController emailController = TextEditingController();
  final AuthService _auth = AuthService();
  bool isLoading = false;
  String successMessage = '';
  String errorMessage = '';
  VoidCallback? onStateChanged;

  ForgotPasswordController({this.onStateChanged});

  void _notify() {
    if (onStateChanged != null) {
      onStateChanged!();
    }
  }

  Future<void> resetPassword() async {
    isLoading = true;
    successMessage = '';
    errorMessage = '';
    _notify();

    try {
      await _auth.forgotPasswordRequest(emailController.text.trim());
      isLoading = false;
      successMessage = 'Password reset email sent!';
      _notify();
    } catch (e) {
      isLoading = false;
      errorMessage = 'Failed to send reset email';
      _notify();
    }
  }

  void openEmailSentDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          'Email Sent',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: TColor.primary,
              ),
        ),
        content: Text(
          'Please check your email manually to reset your password.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void dispose() {
    emailController.dispose();
  }
}
