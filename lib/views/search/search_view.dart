import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/common/color_extension.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController? searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    searchController!.dispose();
  }

  final tagList = ['Genres', 'Best Sellers', 'Trending', 'New Release'];
  var selectTag = 0;

  final bookGenresList = [
    {
      "name": "Fiction & Sci-Fi",
      "img":
          "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1555447414i/44767458.jpg",
    },
    {
      "name": "Mystery & Thriller",
      "img":
          "https://novelonmymind.com/wp-content/uploads/2023/03/The-Silent-Patient-by-Alex-Michaelides.jpg"
    },
    {
      "name": "Comedy & Humor",
      "img":
          "https://m.media-amazon.com/images/I/51sEKdL7GlL._SY445_SX342_.jpg",
    },
    {
      "name": "Fantasy",
      "img":
          "https://ik.imagekit.io/panmac/tr:f-auto,di-placeholder_portrait_aMjPtD9YZ.jpg,w-270/edition/9781035052868.jpg",
    },
    {
      "name": "Romance",
      "img":
          "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1651585695i/58857822.jpg"
    },
    {
      "name": "Horror",
      "img": "https://m.media-amazon.com/images/I/715qjNTdYML._SY466_.jpg",
    },
    {
      "name": "Biography",
      "img":
          "https://m.media-amazon.com/images/I/41zd1OAciUL._SY445_SX342_.jpg",
    },
    {
      "name": "Personal Development",
      "img": "https://booksondemand.ma/cdn/shop/files/POM.png",
    },
    {
      "name": "History & Politics",
      "img": "https://m.media-amazon.com/images/I/61BAecyH6oL._SY466_.jpg",
    },
    {
      "name": "Business & Finance",
      "img":
          "https://www.ft.com/__origami/service/image/v2/images/raw/http://ig.ft.com/static/sites/business-book-of-the-year/covers/More_Money_Than_God.jpg?source=ft_ig_business_book_award&width=400&quality=high",
    },
  ];

  final genresColor = [
    Colors.blue,
    Colors.deepPurpleAccent,
    Colors.green,
    Colors.orange,
    Colors.pinkAccent,
    Colors.yellow,
    Colors.indigo,
    Colors.brown,
    Colors.black,
    Colors.grey,
  ];

  List getUniqueColor() {
    final colors = List.from(genresColor);
    colors.shuffle(Random());
    return colors;
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final uniqueColor = getUniqueColor();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: TextFormField(
          controller: searchController,
          onTap: () {},
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          cursorColor: TColor.primary,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            hintText: 'Search Books or Authors',
            hintStyle: GoogleFonts.poppins(fontSize: 15),
            prefixIcon: Icon(Icons.search),
            suffixIcon: SizedBox(
              width: 40,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.filter_alt),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Row(
                children: tagList.map(
                  (tagName) {
                    var index = tagList.indexOf(tagName);
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            selectTag = index;
                          });
                        },
                        child: Text(
                          tagName,
                          style: GoogleFonts.poppins(
                            color: selectTag == index
                                ? TColor.text
                                : TColor.subText,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 10,
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            bookGenresList[index]['img'].toString(),
                            fit: BoxFit.fill,
                            height: media.width * 0.4,
                            width: media.width * 0.25,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          bookGenresList[index]['name'].toString(),
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
    );
  }
}
