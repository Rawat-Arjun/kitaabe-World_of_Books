import 'package:flutter/material.dart';
import 'package:kitaabe/views/home/book%20detail/book_detail_page.dart';

import '../../../../common/color_extension.dart';
import '../../../../util/model/book_model.dart';
import '../../../../util/storage/local_storage_helper.dart';

class FavouriteView extends StatefulWidget {
  const FavouriteView({super.key});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  late Future<List<BookModel>> favoriteBooks;

  void removeFavoriteBook(BookModel book) async {
    await LocalStorageHelper.removeFavorite(book.id);
    setState(() {
      favoriteBooks = LocalStorageHelper.loadFavorites();
    });
  }

  @override
  void initState() {
    super.initState();
    favoriteBooks = LocalStorageHelper.loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Starred',
          style: textTheme.titleMedium,
        ),
      ),
      body: Center(
        child: FutureBuilder<List<BookModel>>(
          future: favoriteBooks,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite,
                    color: TColor.primary,
                    size: 40,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'No Favourite Book here',
                    style: textTheme.bodyMedium,
                  ),
                ],
              );
            }

            final favoriteBooks = snapshot.data!;
            return ListView.builder(
              itemCount: favoriteBooks.length,
              itemBuilder: (context, index) {
                final book = favoriteBooks[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: 80,
                    decoration: BoxDecoration(
                      color: TColor.primaryLight,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BookDetailPage(book: book),
                        ));
                      },
                      onLongPress: () {
                        removeFavoriteBook(book);
                      },
                      title: Text(
                        book.title,
                        style: textTheme.labelMedium,
                      ),
                      subtitle: Text(
                        book.author,
                        style: textTheme.bodySmall,
                      ),
                      leading: Image.network(
                        book.thumbnail,
                        height: 150,
                      ),
                      trailing: Icon(
                        Icons.favorite,
                        size: 20,
                        color: TColor.primary,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
