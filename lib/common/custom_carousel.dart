import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_extension.dart';

class CustomCarousel extends StatefulWidget {
  final int listLength;
  final List listItem;
  final Color color;
  final String title;
  final bool isRating;

  const CustomCarousel({
    super.key,
    required this.listLength,
    required this.listItem,
    required this.color,
    required this.title,
    required this.isRating,
  });

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.poppins(
            color: widget.color,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          width: media.width,
          height: media.width * 0.5,
          child: CarouselSlider.builder(
            itemCount: widget.listLength,
            itemBuilder: (context, index, realIndex) {
              var lObj = widget.listItem[index] as Map? ?? {};
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
                              offset: Offset(0, 2),
                              blurRadius: 5,
                            ),
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          lObj['img'],
                          fit: BoxFit.fill,
                          height: media.width * 0.35,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      lObj['name'].toString(),
                      maxLines: 2,
                      style: GoogleFonts.poppins(
                        color: TColor.text,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      lObj['author'].toString(),
                      maxLines: 2,
                      style: GoogleFonts.poppins(
                        color: TColor.text,
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5),
                    widget.isRating
                        ? IgnorePointer(
                            ignoring: true,
                            child: RatingBar.builder(
                              direction: Axis.horizontal,
                              initialRating:
                                  double.tryParse(lObj['rating'].toString()) ??
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
