import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitaabe/screens/home/bloc/theme_cubit.dart';

import '../../../components/book_list_carousel.dart';
import '../../../components/color_extension.dart';
import '../../../services/api_service.dart';
import '../../../services/model/book_model.dart';
import '../../../services/storage/auth_service.dart';
import 'drawer/home_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoading = true;
  List<BookModel> topPickBooks = [];
  List<BookModel> bestSellers = [];
  List<BookModel> trendingBooks = [];

  String errorMessage = '';

  final drawerKey = GlobalKey<ScaffoldState>();
  int drawerIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadCategoryBooks();
    _initAuthState();
  }

  Future<void> _loadCategoryBooks() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      topPickBooks =
          await ApiService().fetchBooksByCategory(BookCategory.topPicks);
      bestSellers =
          await ApiService().fetchBooksByCategory(BookCategory.bestSellers);
      trendingBooks =
          await ApiService().fetchBooksByCategory(BookCategory.trending);
    } catch (e) {
      errorMessage = 'Failed to load books. Please try again.';
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  File? image;
  User? user;

  final AuthService _authService = AuthService();

  Future<void> _initAuthState() async {
    final shouldRemember = await _authService.shouldRememberUser();
    final currentUser = _authService.getCurrentUser();

    if (shouldRemember && currentUser != null) {
      setState(() => user = currentUser);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      endDrawer: SafeArea(
        child: HomeDrawer(),
      ),
      key: drawerKey,
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : errorMessage.isNotEmpty
              ? Center(
                  child: Text(
                    errorMessage,
                    style: textTheme.labelMedium,
                  ),
                )
              : topPickBooks.isEmpty && bestSellers.isEmpty
                  ? Center(
                      child: Text(
                        'Books not found',
                        style: textTheme.bodyMedium,
                      ),
                    )
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
                                          radius: 30,
                                          backgroundImage: AssetImage(
                                              'assets/images/app_logo.png'),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          'Welcome :)',
                                          style: textTheme.labelMedium,
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          icon: Icon(
                                            Icons.nightlight,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            BlocProvider.of<ThemeCubit>(context)
                                                .toggleTheme();
                                          },
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            drawerKey.currentState!
                                                .openEndDrawer();
                                          },
                                          icon: const Icon(
                                            Icons.menu,
                                            size: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    BookListCarousel(
                                      isRating: false,
                                      title: 'Our Top Picks',
                                      color: Colors.white,
                                      bookList: topPickBooks.isNotEmpty
                                          ? topPickBooks
                                          : [],
                                    ),
                                    const SizedBox(height: 15),
                                    BookListCarousel(
                                      isRating: false,
                                      title: 'Trending',
                                      color: TColor.text,
                                      bookList: trendingBooks.isNotEmpty
                                          ? trendingBooks
                                          : [],
                                    ),
                                    const SizedBox(height: 15),
                                    BookListCarousel(
                                      isRating: false,
                                      title: 'Best Sellers',
                                      color: TColor.text,
                                      bookList: bestSellers.isNotEmpty
                                          ? bestSellers
                                          : [],
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
