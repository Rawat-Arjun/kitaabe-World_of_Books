import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitaabe/components/custom_button.dart';
import 'package:kitaabe/screens/home/ui/drawer/favourite/bloc/favourite_cubit.dart';
import 'package:kitaabe/services/model/book_model.dart';

import '../../../../components/color_extension.dart';
import 'book_reader_view.dart';

class BookDetailPage extends StatefulWidget {
  final BookModel book;
  const BookDetailPage({required this.book, super.key});

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  bool haveImage = true;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final isLiked = context.watch<FavouriteCubit>().isBookFavorite(widget.book);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Center(
              child: IconButton(
                onPressed: () {
                  context.read<FavouriteCubit>().toggleFavorite(widget.book);
                },
                icon: isLiked
                    ? Icon(
                        Icons.favorite,
                        color: TColor.primary,
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            const BoxShadow(
                              color: Colors.black87,
                              offset: Offset(0, 2),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            haveImage
                                ? widget.book.thumbnail
                                : 'https://imgs.search.brave.com/S4x0to1Mk1bW3RKrhxVv8W3K2xxjjKalG0PoyqDEG3o/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy82/LzY1L05vLUltYWdl/LVBsYWNlaG9sZGVy/LnN2Zw',
                            fit: BoxFit.fill,
                            height: 150,
                            width: 120,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        widget.book.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        widget.book.author,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Rating',
                                style: textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                widget.book.averageRating.toString(),
                                style: textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Language',
                                style: textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                widget.book.language.toString(),
                                style: textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Pages',
                                style: textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                widget.book.pageCount.toString(),
                                style: textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 80,
                          bottom: 60,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Text(
                                'About Book',
                                style: textTheme.titleMedium,
                              ),
                            ),
                            Text(
                              widget.book.description,
                              style: textTheme.bodySmall,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Center(
                              child: CustomButton(
                                minHeight: 50,
                                minWidth: 150,
                                boxDecoration: BoxDecoration(
                                  color: TColor.primary,
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => BookReaderView(
                                        book: widget.book,
                                      ),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.book,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Read',
                                      style: textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
