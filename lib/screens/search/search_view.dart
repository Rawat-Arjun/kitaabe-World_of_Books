import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kitaabe/components/genre_book_view.dart';
import 'package:kitaabe/components/list_data.dart';
import 'package:kitaabe/screens/search/search_book_field.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List getUniqueColor() {
    final colors = List.from(ListData.genresColor);
    colors.shuffle(Random());
    return colors;
  }

  final CancelToken token = CancelToken();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final uniqueColor = getUniqueColor();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SearchBookField(),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => GenreBooksPage(
                            genre: ListData.bookGenresList[index]['name']
                                .toString(),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: uniqueColor[index],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                ListData.bookGenresList[index]['img']
                                    .toString(),
                                fit: BoxFit.fill,
                                height: mediaQuery.width * 0.4,
                                width: mediaQuery.width * 0.25,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              ListData.bookGenresList[index]['name'].toString(),
                              style: textTheme.labelMedium,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
