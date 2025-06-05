import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/views/onboarding/get_started_view.dart';

import '../../common/list_data.dart';
import 'package:kitaabe/common/list_data.dart';
import 'package:kitaabe/util/storage/sp_storage_service.dart';
import 'package:kitaabe/views/onboarding/get_started_view.dart';


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
    final mediaQuery = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(

      backgroundColor: Colors.white,

      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: ListData().pageArr.length,
            itemBuilder: (context, index) {
              var pObj = ListData().pageArr[index] as Map? ?? {};
              return Container(
                width: media.width,
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 40,
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

      body: PageView.builder(
        controller: pageController,
        itemCount: ListData.onboardingPageArr.length,
        itemBuilder: (context, index) {
          var onboardingPageList =
              ListData.onboardingPageArr[index] as Map? ?? {};
          return Container(
            width: mediaQuery.width,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 60,

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
                              children: ListData().pageArr.map(
                                (e) {
                                  var index = ListData().pageArr.indexOf(e);
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

                  onboardingPageList['title'].toString(),
                  textAlign: TextAlign.center,
                  style: textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  onboardingPageList['sub_text'].toString(),
                  textAlign: TextAlign.center,
                  style: textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 40,
                ),
                Opacity(
                  opacity: 0.5,
                  child: SvgPicture.asset(
                    onboardingPageList['img'].toString(),
                    width: double.infinity,
                    height: mediaQuery.height * 0.30,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            SpStorageService.setOnboardingSeen(context);
                          },
                          child: Text(
                            'Skip',
                            style: textTheme.labelMedium
                                ?.copyWith(color: TColor.primary),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: ListData.onboardingPageArr.map(
                        (e) {
                          var index = ListData.onboardingPageArr.indexOf(e);
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
                            style: textTheme.labelMedium
                                ?.copyWith(color: TColor.primary),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

              );
            },
          ),
        ],


              ],
            ),
          );
        },
      ),
    );
  }
}