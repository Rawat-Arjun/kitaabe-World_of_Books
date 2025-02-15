import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/common/custom_carousel.dart';
import 'package:kitaabe/common/list_data.dart';
import 'package:kitaabe/views/home/main_tab_bar.dart';

class MyAccountView extends StatefulWidget {
  const MyAccountView({super.key});

  @override
  State<MyAccountView> createState() => _MyAccountViewState();
}

class _MyAccountViewState extends State<MyAccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const MainTabBar(),
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Arjun Rawat',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: TColor.text,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          'An Book Enthusiast who loves to read free books and make time invested :)',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: TColor.subText,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: CircleAvatar(
                      backgroundColor: TColor.primary,
                      radius: 40,
                      child: Icon(
                        Icons.photo,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 15,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: 150,
                    child: Text(
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      'Kabligate Mubarikpur Road, Mawana (Meerut)',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: TColor.subText,
                      ),
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Edit Profile',
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        '7',
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          color: TColor.subText,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Books',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: TColor.subText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text(
                        '5',
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          color: TColor.subText,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Reviews',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: TColor.subText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 30),
              CustomCarousel(
                listLength: ListData().bookList.length,
                listItem: ListData().bookList,
                color: TColor.subText,
                title: 'My Books',
                isRating: false,
              ),
              Text(
                'My Reviews',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: TColor.subText,
                  fontWeight: FontWeight.w700,
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: ListData().reviewsList.length,
                itemBuilder: (context, index) {
                  var rObj = ListData().reviewsList[index] as Map;

                  return Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      color: TColor.primaryLight,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              rObj["book_name"],
                              style: GoogleFonts.poppins(
                                color: TColor.subText,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              rObj["author_name"],
                              style: GoogleFonts.poppins(
                                color: TColor.subText,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              width: 200,
                              child: Text(
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                rObj["review"],
                                style: GoogleFonts.poppins(
                                  color: TColor.text,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              child: IgnorePointer(
                                ignoring: true,
                                child: RatingBar.builder(
                                  direction: Axis.horizontal,
                                  initialRating: double.tryParse(
                                          rObj['rating'].toString()) ??
                                      1,
                                  minRating: 1,
                                  maxRating: 5,
                                  unratedColor: Colors.grey,
                                  glowColor: TColor.primary,
                                  itemSize: 15,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 1),
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: TColor.primary,
                                  ),
                                  onRatingUpdate: (rating) {},
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black87,
                                  offset: Offset(0, 2),
                                  blurRadius: 5,
                                ),
                              ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              'https://upload.wikimedia.org/wikipedia/commons/e/e7/Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg',
                              fit: BoxFit.fill,
                              height: 100,
                              width: 80,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
