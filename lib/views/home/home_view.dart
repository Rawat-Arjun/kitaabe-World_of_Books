import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/common/book_genre_carousel.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/common/book_list_carousel.dart';
import 'package:kitaabe/main.dart';
import 'package:kitaabe/service/api_service.dart';
import 'package:kitaabe/service/book_model.dart';
import 'package:kitaabe/views/home/drawer/home_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoading = true;
  List<BookModel> book = [];
  String errorMessage = '';

  final drawerKey = GlobalKey<ScaffoldState>();
  int drawerIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  Future<void> _loadBooks() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      book = await ApiService().fetchBooks();
    } catch (e) {
      errorMessage = 'Failed to load books. Please try again.';
      print('Error: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: SafeArea(
        child: HomeDrawer(),
      ),
      key: drawerKey,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(
                  child: Text(
                    errorMessage,
                    style: GoogleFonts.poppins(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : book.isEmpty
                  ? const Center(child: Text('No books found'))
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 40,
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Align(
                                  child: Transform.scale(
                                    scale: 2,
                                    origin: Offset(0, mediaQuery.width * 0.85),
                                    child: Container(
                                      height: mediaQuery.height * 0.5,
                                      width: mediaQuery.width,
                                      decoration: BoxDecoration(
                                        color: TColor.primary,
                                        borderRadius: BorderRadius.circular(
                                          mediaQuery.width * 0.9,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: TColor.primaryLight,
                                          radius: 20,
                                          child: Text('AR'),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'Welcome User :)',
                                          style: GoogleFonts.poppins(
                                            color: TColor.primaryLight,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Spacer(),
                                        IconButton(
                                            onPressed: () {
                                              bool isCurrentlyDark =
                                                  themeModeNotifier.value ==
                                                      ThemeMode.dark;
                                              bool shouldBeDark =
                                                  !isCurrentlyDark; // toggle

                                              themeModeNotifier.value =
                                                  shouldBeDark
                                                      ? ThemeMode.dark
                                                      : ThemeMode.light;
                                              toggleTheme(shouldBeDark);
                                            },
                                            icon: Icon(
                                              Icons.nightlight,
                                              size: 30,
                                            )),
                                        IconButton(
                                          onPressed: () {
                                            drawerKey.currentState!
                                                .openEndDrawer();
                                          },
                                          icon: Icon(
                                            Icons.menu,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    BookListCarousel(
                                      isRating: false,
                                      title: 'Our Top Picks',
                                      color: Colors.white,
                                      bookList: book.isNotEmpty ? book : [],
                                    ),
                                    SizedBox(height: 15),
                                    BookGenreCarousel(),
                                    SizedBox(height: 15),
                                    BookListCarousel(
                                      isRating: true,
                                      title: 'Best Sellers',
                                      color: TColor.text,
                                      bookList: book.isNotEmpty ? book : [],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
    );
  }
}
