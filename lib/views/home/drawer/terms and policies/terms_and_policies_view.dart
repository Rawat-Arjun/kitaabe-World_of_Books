import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/common/custom_button.dart';
import 'package:kitaabe/common/list_data.dart';
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
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        elevation: 0,
        title: Text(
          "Terms & Policies",
          style: textTheme.titleLarge,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: TColor.text,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Column(
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
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: ListData.termsAndConditionsList.length,
                  itemBuilder: (context, index) {
                    final termsList =
                        ListData.termsAndConditionsList[index] as Map;
                    return Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: TColor.primary,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 5),
                            child: Text(
                              ' * ${termsList['term']}',
                              style: textTheme.labelMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              termsList['policy'],
                              style: textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
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
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
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
                        style: textTheme.bodySmall,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
