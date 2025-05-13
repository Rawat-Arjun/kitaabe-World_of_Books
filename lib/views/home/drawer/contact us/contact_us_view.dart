import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/common/custom_button.dart';

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
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        elevation: 0,
        title: Text(
          'Contact Us',
          style: textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Center(
              child: Opacity(
                opacity: 0.5,
                child: SvgPicture.asset(
                  'assets/images/contact_us.svg',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            TextFormField(
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              cursorColor: TColor.primary,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: TColor.primary,
                    width: 2,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                hintText: 'Email Address',
                hintStyle: textTheme.bodySmall,
              ),
            ),
            const SizedBox(
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
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: TColor.primary,
                    width: 2,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                hintText: 'Message',
                hintStyle: textTheme.bodySmall,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              onPressed: () async {
                emailController.text = '';
                messageController.text = '';
                await Future.delayed(
                  Duration(
                    seconds: 2,
                  ),
                  () {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text(
                            'Message submitted successfully !',
                            style: textTheme.bodySmall?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                );
              },
              minHeight: 50,
              minWidth: 200,
              boxDecoration: BoxDecoration(
                color: TColor.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Submit',
                  style: textTheme.bodySmall,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
