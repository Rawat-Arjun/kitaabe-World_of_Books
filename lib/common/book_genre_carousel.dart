import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/common/list_data.dart';

import 'color_extension.dart';

class BookGenreCarousel extends StatelessWidget {
  const BookGenreCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Column(
      children: [
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
            itemCount: ListData.genresList.length,
            itemBuilder: (context, index) {
              var gObj = ListData.genresList[index] as Map? ?? {};
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
      ],
    );
  }
}
