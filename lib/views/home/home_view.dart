import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/common/custom_carousel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final bookList = [
    {
      "name": "To Kill A Mockingbird",
      "author": "Harper Lee",
      "img":
          "https://upload.wikimedia.org/wikipedia/commons/4/4f/To_Kill_a_Mockingbird_%28first_edition_cover%29.jpg",
      "rating": "5",
    },
    {
      "name": "Invisible Man",
      "author": "Ralph Ellison",
      "img":
          "https://m.media-amazon.com/images/I/41Gh5-nfqKL._SY445_SX342_.jpg",
      "rating": "4.5",
    },
    {
      "name": "The Great Gatsby",
      "author": "F. Scott Fitzgerald",
      "img":
          "https://rukminim2.flixcart.com/image/416/416/kgiaykw0/book/4/2/9/the-great-gatsby-original-imafwqc4fdxy5ymr.jpeg",
      "rating": "5",
    },
    {
      "name": "The Fault in Our Stars",
      "author": "John Green",
      "img":
          "https://m.media-amazon.com/images/I/51r27MDeQQL._SY445_SX342_.jpg",
      "rating": "4.5",
    },
    {
      "name": "Lord of The Flies",
      "author": "William Golding",
      "img":
          "https://upload.wikimedia.org/wikipedia/en/9/9b/LordOfTheFliesBookCover.jpg",
      "rating": "4",
    },
  ];

  final genresList = [
    {
      "name": "Romance",
      "img":
          "https://i0.wp.com/readwithstefani.com/wp-content/uploads/2021/12/collage-1.png"
    },
    {
      "name": "Fiction",
      "img":
          "https://www.scholastic.com/content/dam/scholastic/educators/book-lists/080824-nonfiction-grades-3-5-16-9.png.corpimagerendition.xxl.1400.788.png"
    },
    {
      "name": "Thriller",
      "img":
          "https://novelsuspects.com/wp-content/uploads/2020/09/EscapeIntoThesePsychologicalThrillers.png"
    },
    {
      "name": "Fantasy",
      "img":
          "https://cdn.kpbs.org/dims4/default/f829725/2147483647/strip/true/crop/1750x1078+83+0/resize/1760x1084!/format/webp/quality/90/?url=https%3A%2F%2Fmedia.npr.org%2Fassets%2Fimg%2F2024%2F05%2F08%2Funtitled-design-63-_wide-ceaf458f328eaf47079bfc4c7560c59e97bfde79.jpg"
    },
    {
      "name": "Horror",
      "img":
          "https://images.herzindagi.info/her-zindagi-english/images/2024/10/25/article/image/horror-1729868961021.jpg"
    },
  ];

  final menuKey = GlobalKey<ScaffoldState>();

  final menuList = [
    {
      "name": "Home",
      "icon": Icons.home,
    },
    {
      "name": "My Books",
      "icon": Icons.book,
    },
    {
      "name": "Recently Read",
      "icon": Icons.menu_book_sharp,
    },
    {
      "name": "Settings",
      "icon": Icons.settings,
    },
    {
      "name": "My Account",
      "icon": Icons.person,
    },
    {
      "name": "Help",
      "icon": Icons.help,
    },
    {
      "name": "FAQs",
      "icon": Icons.question_answer,
    },
    {
      "name": "Log Out",
      "icon": Icons.logout,
    },
  ];
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
                children: menuList.map(
                  (e) {
                    int index = menuList.indexOf(e);
                    return Container(
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
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            menuIndex = index;
                          });
                        },
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
                          CircleAvatar(
                            backgroundColor: TColor.primaryLight,
                            radius: 20,
                            child: Text('AR'),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Welcome User :)',
                            style: GoogleFonts.poppins(
                              color: TColor.primaryLight,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
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
                        listLength: bookList.length,
                        listItem: bookList,
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
                          itemCount: genresList.length,
                          itemBuilder: (context, index) {
                            var gObj = genresList[index] as Map? ?? {};
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
                        listLength: bookList.length,
                        listItem: bookList,
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
