import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitaabe/components/color_extension.dart';
import 'package:kitaabe/services/forgot_password_controller.dart';
import '../../components/custom_button.dart';
import '../../components/custom_text_field.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formkey = GlobalKey<FormState>();
  late ForgotPasswordController controller;

  @override
  void initState() {
    controller = ForgotPasswordController(
      onStateChanged: () {
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forgot Password',
                  style: textTheme.titleLarge,
                ),
                SizedBox(
                  height: mediaQuery.height * 0.05,
                ),
                Opacity(
                  opacity: 0.5,
                  child: SvgPicture.asset(
                    'assets/images/forgot_password.svg',
                    placeholderBuilder: (context) =>
                        CircularProgressIndicator(),
                    width: double.infinity,
                    height: mediaQuery.height * 0.3,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  text: 'Email Address',
                  controller: controller.emailController,
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
                const SizedBox(
                  height: 10,
                ),
                controller.isLoading
                    ? Center(
                        child: const CircularProgressIndicator(),
                      )
                    : CustomButton(
                        minHeight: 50,
                        onPressed: () async {
                          if (!_formkey.currentState!.validate()) return;

                          await controller.resetPassword();
                          if (controller.successMessage.isNotEmpty) {
                            controller.openEmailSentDialog(context);
                          }
                          controller.emailController.text = '';
                        },
                        boxDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: TColor.primary,
                        ),
                        child: Center(
                          child: Text(
                            "Submit",
                            style: textTheme.bodySmall,
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
