import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/components/color_extension.dart';
import 'package:kitaabe/components/list_data.dart';
import 'package:kitaabe/screens/onboarding/get_started_view.dart';
import 'package:kitaabe/services/storage/sp_storage_service.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int page = 0;
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      page = pageController.page?.round() ?? 0;
      if (mounted) setState(() {});
    });
  }

  void nextPageFunction() {
    if (page < ListData.onboardingPageArr.length - 1) {
      page += 1;
      pageController.jumpToPage(page);
    } else {
      SpStorageService.setOnboardingSeen(context);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const GetStartedView(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: pageController,
        itemCount: ListData.onboardingPageArr.length,
        itemBuilder: (context, index) {
          var pageData = ListData.onboardingPageArr[index] as Map? ?? {};
          return Container(
            width: media.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              children: [
                Text(
                  pageData['title'].toString(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: TColor.primary,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  pageData['sub_text'].toString(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: TColor.primaryLight,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 40),
                Opacity(
                  opacity: 0.5,
                  child: SvgPicture.asset(
                    pageData['img'].toString(),
                    width: double.infinity,
                    height: media.height * 0.45,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        SpStorageService.setOnboardingSeen(context);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const GetStartedView(),
                          ),
                        );
                      },
                      child: Text(
                        'Skip',
                        style: textTheme.labelMedium
                            ?.copyWith(color: TColor.primary),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        ListData.onboardingPageArr.length,
                        (i) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                            color: page == i
                                ? TColor.primary
                                : TColor.primaryLight,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: nextPageFunction,
                          child: Text(
                            'Next',
                            style: textTheme.labelMedium
                                ?.copyWith(color: TColor.primary),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
