import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/common/custom_button.dart';
import 'package:kitaabe/views/home/main_tab_bar.dart';

class TermsAndPoliciesView extends StatefulWidget {
  const TermsAndPoliciesView({super.key});

  @override
  State<TermsAndPoliciesView> createState() => _TermsAndPoliciesViewState();
}

class _TermsAndPoliciesViewState extends State<TermsAndPoliciesView> {
  bool isAllowTerms = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: TColor.primary,
        elevation: 0,
        title: Text(
          "Terms & Policies",
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: TColor.text,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: TColor.text),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const MainTabBar(),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Opacity(
                  opacity: 0.5,
                  child: SvgPicture.asset(
                    'assets/images/terms.svg',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              _buildSectionTitle("1. Introduction"),
              _buildSectionText(
                "Welcome to Kitaabe, an online book reading platform. By using this app, you agree to the following terms and conditions.",
              ),
              _buildSectionTitle("2. User Accounts & Responsibilities"),
              _buildSectionText(
                "You must provide accurate information when signing up. Misuse, unauthorized access, or violation of community guidelines may result in account suspension.",
              ),
              _buildSectionTitle("3. Content Usage & Restrictions"),
              _buildSectionText(
                "All book content is for personal use only. You may not copy, distribute, or reproduce any material without permission.",
              ),
              _buildSectionTitle("4. Privacy Policy"),
              _buildSectionText(
                "We collect user data such as email, bookmarks, and reviews to improve user experience. We do not sell or misuse personal data.",
              ),
              _buildSectionTitle("5. Reviews & Community Guidelines"),
              _buildSectionText(
                "Users must ensure that their reviews are respectful and relevant. Any offensive or misleading content may be removed.",
              ),
              _buildSectionTitle("6. Account Deletion & Data Removal"),
              _buildSectionText(
                "You can request to delete your account from the profile settings. Some data may be retained for security and legal reasons.",
              ),
              _buildSectionTitle("7. Disclaimer & Liability"),
              _buildSectionText(
                "This app is provided 'as is' without any warranties. We are not responsible for issues caused by third-party content.",
              ),
              _buildSectionTitle("8. Updates & Changes"),
              _buildSectionText(
                "These terms may be updated from time to time. Continued use of the app indicates acceptance of the new terms.",
              ),
              _buildSectionTitle("9. Contact Information"),
              _buildSectionText(
                "If you have any questions about these terms, please contact us at arjunrawat12121@gmail.com.",
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
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: CustomButton(
                  minHeight: 50,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const MainTabBar(),
                      ),
                    );
                  },
                  boxDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: TColor.primary,
                  ),
                  child: Center(
                    child: Text(
                      "Accept & Continue",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 5),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 15,
          color: TColor.text,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSectionText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 15,
          color: TColor.subText,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
