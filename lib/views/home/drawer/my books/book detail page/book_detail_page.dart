import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/common/custom_button.dart';
import 'package:kitaabe/service/book_model.dart';

import '../../../../../common/color_extension.dart';

class BookDetailPage extends StatefulWidget {
  final BookModel book;
  const BookDetailPage({required this.book, super.key});

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  bool isLiked = false;
  bool haveImage = true;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: TColor.primary,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        actions: [
          Container(
            margin: EdgeInsets.all(10),
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: TColor.primaryLight,
            ),
            child: Center(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
                icon: isLiked
                    ? Icon(
                        Icons.favorite,
                        color: Colors.pink[300],
                      )
                    : Icon(
                        Icons.favorite_outline,
                        color: Colors.grey,
                      ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    child: Transform.scale(
                      scale: 2,
                      origin: Offset(0, mediaQuery.width * 0.85),
                      child: Container(
                        height: mediaQuery.height * 0.55,
                        width: mediaQuery.width,
                        decoration: BoxDecoration(
                          color: TColor.primary,
                          borderRadius:
                              BorderRadius.circular(mediaQuery.width * 0.5),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
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
                              haveImage
                                  ? widget.book.thumbnail
                                  : 'https://imgs.search.brave.com/S4x0to1Mk1bW3RKrhxVv8W3K2xxjjKalG0PoyqDEG3o/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy82/LzY1L05vLUltYWdl/LVBsYWNlaG9sZGVy/LnN2Zw',
                              // 'https://upload.wikimedia.org/wikipedia/commons/e/e7/Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg',
                              fit: BoxFit.fill,
                              height: 150,
                              width: 120,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.book.title,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: TColor.text,
                          ),
                        ),
                        Text(
                          widget.book.author,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: TColor.subText,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Rating',
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: TColor.text,
                                  ),
                                ),
                                Text(
                                  widget.book.averageRating.toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: TColor.subText,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Pages',
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: TColor.text,
                                  ),
                                ),
                                Text(
                                  widget.book.pageCount.toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: TColor.subText,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'About Book',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: TColor.text,
                              ),
                            ),
                            Text(
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              widget.book.description,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: TColor.subText,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Center(
                              child: CustomButton(
                                  minHeight: 50,
                                  minWidth: 150,
                                  boxDecoration: BoxDecoration(
                                      color: TColor.primary,
                                      borderRadius: BorderRadius.circular(8)),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.book,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Read',
                                        style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
