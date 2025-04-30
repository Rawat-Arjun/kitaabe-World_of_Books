import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/common/list_data.dart';
import 'package:kitaabe/views/search/search_focus_view.dart';

import '../../common/custom_search_delegate.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late final TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  List getUniqueColor() {
    final colors = List.from(ListData.genresColor);
    colors.shuffle(Random());
    return colors;
  }

  final CancelToken token = CancelToken();
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final uniqueColor = getUniqueColor();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: TextFormField(
          showCursor: false,
          onTap: () {
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(
                data: (query) {
                  return SearchFocusView(query: query);
                },
              ),
            );
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: TColor.primary,
                width: 2,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            hintText: 'Search Books or Authors',
            hintStyle: GoogleFonts.poppins(fontSize: 15),
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  return Container(
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
                              ListData.bookGenresList[index]['img'].toString(),
                              fit: BoxFit.fill,
                              height: media.width * 0.4,
                              width: media.width * 0.25,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            ListData.bookGenresList[index]['name'].toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
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
