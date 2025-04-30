import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/service/book_model.dart';

import 'color_extension.dart';

class BookListCarousel extends StatelessWidget {
  final List<BookModel> bookList;
  final Color color;
  final String title;
  final bool isRating;

  const BookListCarousel({
    super.key,
    required this.bookList,
    required this.color,
    required this.title,
    required this.isRating,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            color: color,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          width: media.width,
          height: media.width * 0.5,
          child: CarouselSlider.builder(
            itemCount: bookList.length,
            itemBuilder: (context, index, realIndex) {
              final book = bookList[index];
              return SizedBox(
                height: media.width * 0.3,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black87,
                              offset: Offset(0, 1),
                              blurRadius: 5,
                            ),
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          // data['items']['volumeInfo']['imageLinks']
                          //     ['thumbnail'],
                          book.thumbnail.isNotEmpty ? book.thumbnail : '',
                          fit: BoxFit.fill,
                          height: media.width * 0.35,
                          width: media.width * 0.25,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      // data['items']['volumeInfo']['title'],
                      book.title.isNotEmpty ? book.title : 'No title Found',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        color: TColor.text,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      // data['items']['valueInfo']['authors'],
                      book.author.isNotEmpty ? book.author : 'Unknown Author',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        color: TColor.text,
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5),
                    isRating
                        ? IgnorePointer(
                            ignoring: true,
                            child: RatingBar.builder(
                              direction: Axis.horizontal,
                              // initialRating: double.tryParse(
                              //         data['volumeInfo']['averageRating']) ??
                              //     1,
                              initialRating: book.averageRating,
                              minRating: 0,
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
                          )
                        : SizedBox(),
                  ],
                ),
              );
            },
            options: CarouselOptions(
              aspectRatio: 1,
              enlargeCenterPage: true,
              autoPlay: false,
              viewportFraction: 0.35,
              enlargeFactor: 0.2,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
            ),
          ),
        ),
      ],
    );
  }
}
