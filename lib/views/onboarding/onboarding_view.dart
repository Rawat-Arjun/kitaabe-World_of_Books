import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/views/onboarding/get_started_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState(); 
}

class _OnboardingViewState extends State<OnboardingView> {
  int page = 0;
  final pageController = PageController();
  List pageArr = [
    {
      'title': "Discover a World of Stories",
      'sub_text':
          "Delve into a diverse collection of novels, non-fiction, poetry, and more. Whether you're into mysteries, self-help, or classics, there's something for every reader",
      'img': 'assets/images/on_1.svg',
    },
    {
      'title': "Personalized Just for You",
      'sub_text':
          "We understand your taste. Get personalized book recommendations based on your preferences, reading history, and favorite genres",
      'img': 'assets/images/on_2.svg',
    },
    {
      'title': "Your Reading, Anytime, Anywhere",
      'sub_text':
          "Enjoy your books wherever you are. With online reading, bookmarks, and customizable themes, your library is always at your fingertips.",
      'img': 'assets/images/on_3.svg',
    }
  ];

  @override
  void initState() {
    super.initState();
    pageController.addListener(
      () {
        page = pageController.page?.round() ?? 0;
        if (mounted) {
          setState(() {});
        }
      },
    );
  }

  void nextPageFunction() {
    if (page < 2) {
      page = page + 1;
      pageController.jumpToPage(page);
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const GetStartedView(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: pageController,
        itemCount: pageArr.length,
        itemBuilder: (context, index) {
          var pObj = pageArr[index] as Map? ?? {};
          return Container(
            width: media.width,
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 40,
            ),
            child: Column(
              children: [
                Text(
                  pObj['title'].toString(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: TColor.primary,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  pObj['sub_text'].toString(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: TColor.primaryLight,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 40,),
                Opacity(
                  opacity: 0.5,
                  child: SvgPicture.asset(
                    pObj['img'].toString(),
                    width: double.infinity,
                    height: media.height * 0.45,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Spacer(),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          GetStartedView(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Skip',
                                  style: GoogleFonts.poppins(
                                      color: TColor.primary,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: pageArr.map(
                            (e) {
                              var index = pageArr.indexOf(e);
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                  color: page == index
                                      ? TColor.primary
                                      : TColor.primaryLight,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: nextPageFunction,
                              child: Text(
                                'Next',
                                style: GoogleFonts.poppins(
                                    color: TColor.primary,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20),
                              ),
                            ),
                          ],
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