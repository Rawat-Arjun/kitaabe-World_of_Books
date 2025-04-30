import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/common/list_data.dart';
import 'package:kitaabe/views/home/main_tab_bar.dart';

class MyBooksView extends StatefulWidget {
  const MyBooksView({super.key});

  @override
  State<MyBooksView> createState() => _MyBooksViewState();
}

class _MyBooksViewState extends State<MyBooksView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const MainTabBar(),
              ),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'My Books',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: TColor.text,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: ListData.reviewsList.length,
          itemBuilder: (context, index) {
            var rObj = ListData.reviewsList[index] as Map;

            return GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: TColor.primaryLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
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
                    Spacer(),
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
                            maxLines: 3,
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
                              initialRating:
                                  double.tryParse(rObj['rating'].toString()) ??
                                      1,
                              minRating: 1,
                              maxRating: 5,
                              unratedColor: Colors.grey,
                              glowColor: TColor.primary,
                              itemSize: 15,
                              itemPadding: EdgeInsets.symmetric(horizontal: 1),
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
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
