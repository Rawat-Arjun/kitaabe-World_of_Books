import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../services/model/book_model.dart';
import '../../../../../../services/storage/local_storage_helper.dart';

class FavouriteState {
  final List<BookModel> favorites;
  const FavouriteState({required this.favorites});
}

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(const FavouriteState(favorites: [])) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final favs = await LocalStorageHelper.loadFavorites();
    emit(FavouriteState(favorites: favs));
  }

  Future<void> toggleFavorite(BookModel book) async {
    final currentFavs = [...state.favorites];
    final isFavorite = currentFavs.any((b) => b.id == book.id);

    if (isFavorite) {
      currentFavs.removeWhere((b) => b.id == book.id);
      await LocalStorageHelper.removeFavorite(book.id);
    } else {
      currentFavs.add(book);
      await LocalStorageHelper.saveFavorites(currentFavs);
    }

    emit(FavouriteState(favorites: currentFavs));
  }

  bool isBookFavorite(BookModel book) {
    return state.favorites.any((b) => b.id == book.id);
  }
}
