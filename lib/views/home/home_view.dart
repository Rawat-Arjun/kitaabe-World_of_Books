import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/common/custom_carousel.dart';
import 'package:kitaabe/common/list_data.dart';
import 'package:kitaabe/views/home/drawer/my%20account/my_account_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final menuKey = GlobalKey<ScaffoldState>();

  int menuIndex = 0;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: SafeArea(
        child: Drawer(
          width: media.width * 0.5,
          backgroundColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                media.width * 0.9,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      media.width * 0.9,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 15,
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: ListData().menuList.map(
                  (e) {
                    int index = ListData().menuList.indexOf(e);
                    return InkWell(
                      onTap: () {
                        setState(() {
                          menuIndex = index;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: menuIndex == index
                            ? BoxDecoration(
                                color: TColor.primary,
                                boxShadow: [
                                  BoxShadow(
                                    color: TColor.primary,
                                    blurRadius: 10,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              )
                            : null,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              e['name'].toString(),
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: menuIndex == index
                                    ? Colors.white
                                    : TColor.text,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              e['icon'] as IconData,
                              color: menuIndex == index
                                  ? Colors.white
                                  : TColor.primary,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ),
      ),
      key: menuKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 40,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    child: Transform.scale(
                      scale: 2,
                      origin: Offset(0, media.width * 0.85),
                      child: Container(
                        height: media.height * 0.5,
                        width: media.width,
                        decoration: BoxDecoration(
                          color: TColor.primary,
                          borderRadius: BorderRadius.circular(
                            media.width * 0.9,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const MyAccountView(),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              backgroundColor: TColor.primaryLight,
                              radius: 20,
                              child: Text('AR'),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Welcome, Arjun Rawat :)',
                            style: GoogleFonts.poppins(
                              color: TColor.subText,
                              fontSize: 15,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              menuKey.currentState!.openEndDrawer();
                            },
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      CustomCarousel(
                        isRating: false,
                        title: 'Our Top Picks',
                        color: Colors.white,
                        listLength: ListData().bookList.length,
                        listItem: ListData().bookList,
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            'Genres',
                            style: GoogleFonts.poppins(
                              color: TColor.text,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        height: media.height * 0.25,
                        decoration: BoxDecoration(
                            color: TColor.primaryLight,
                            borderRadius: BorderRadius.circular(8)),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: ListData().genresList.length,
                          itemBuilder: (context, index) {
                            var gObj =
                                ListData().genresList[index] as Map? ?? {};
                            return Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      gObj['img'],
                                      fit: BoxFit.fill,
                                      height: media.height * 0.15,
                                      width: media.width * 0.7,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  gObj['name'].toString(),
                                  style: GoogleFonts.poppins(fontSize: 15),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 15),
                      CustomCarousel(
                        isRating: true,
                        title: 'Best Sellers',
                        color: TColor.text,
                        listLength: ListData().bookList.length,
                        listItem: ListData().bookList,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
