import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kitaabe/services/model/book_model.dart';
import 'package:kitaabe/screens/home/ui/book%20detail/book_detail_page.dart';

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
    final textTheme = Theme.of(context).textTheme;
    final media = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.titleLarge,
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
                    GestureDetector(
                      onTap: () {
                        print("Tapped on book: ${book.title}");
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BookDetailPage(book: book),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black87,
                              offset: Offset(0, 1),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            book.thumbnail.isNotEmpty ? book.thumbnail : '',
                            fit: BoxFit.fill,
                            height: media.width * 0.35,
                            width: media.width * 0.25,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      book.title.isNotEmpty ? book.title : 'No title Found',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.labelMedium,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      book.author.isNotEmpty ? book.author : 'Unknown Author',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.labelSmall,
                      textAlign: TextAlign.center,
                    ),
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
