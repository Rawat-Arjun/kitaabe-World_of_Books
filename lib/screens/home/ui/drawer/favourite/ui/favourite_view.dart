import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitaabe/screens/home/ui/book%20detail/book_detail_page.dart';
import 'package:kitaabe/screens/home/ui/drawer/favourite/bloc/favourite_cubit.dart';

import '../../../../../../components/color_extension.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favourite',
          style: textTheme.titleMedium,
        ),
      ),
      body: BlocBuilder<FavouriteCubit, FavouriteState>(
        builder: (context, state) {
          final favouriteBooks = state.favorites;

          if (favouriteBooks.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: TColor.primary,
                    size: 40,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'No Favourite Book here',
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: favouriteBooks.length,
            itemBuilder: (context, index) {
              final book = favouriteBooks[index];
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BookDetailPage(book: book),
                        ),
                      );
                    },
                    onLongPress: () {
                      context.read<FavouriteCubit>().toggleFavorite(book);
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
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.book, size: 40, color: Colors.grey);
                      },
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
    );
  }
}
