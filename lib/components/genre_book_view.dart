import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kitaabe/components/color_extension.dart';
import 'package:kitaabe/services/api_service.dart';
import 'package:kitaabe/services/model/book_model.dart';
import 'package:kitaabe/screens/home/ui/book%20detail/book_detail_page.dart';

class GenreBooksPage extends StatefulWidget {
  final String genre;
  const GenreBooksPage({
    required this.genre,
    super.key,
  });

  @override
  State<GenreBooksPage> createState() => _GenreBooksPageState();
}

class _GenreBooksPageState extends State<GenreBooksPage> {
  late Future<List<BookModel>> _booksFuture;

  @override
  void initState() {
    super.initState();
    _booksFuture = ApiService().fetchGenreBooks(widget.genre);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.genre} Books",
          style: textTheme.titleMedium,
        ),
      ),
      body: FutureBuilder<List<BookModel>>(
        future: _booksFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError ||
              !snapshot.hasData ||
              snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                "Books not found",
                style: textTheme.bodyMedium,
              ),
            );
          }

          final books = snapshot.data!;
          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BookDetailPage(book: book),
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: TColor.primary,
                  ),
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(book.thumbnail,
                            height: 100, width: 70, fit: BoxFit.cover),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book.title,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.labelMedium,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              ' Author(s): ${book.author}',
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.labelSmall,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            IgnorePointer(
                              ignoring: true,
                              child: RatingBar.builder(
                                direction: Axis.horizontal,
                                initialRating: book.averageRating,
                                unratedColor: Colors.grey[350],
                                itemSize: 20,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 1),
                                allowHalfRating: true,
                                itemCount: 5,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
