import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../model/book_model.dart';
import '../model/user_model.dart';

class LocalStorageHelper {
// set directory path
  static Future<String> getDirectoryPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

// get file from profile
  static Future<File> getProfileFile() async {
    final path = await getDirectoryPath();
    return File('$path/user_profile.json');
  }

// save file from profile
  static Future<void> saveUserProfile(UserModel user) async {
    final file = await getProfileFile();
    await file.writeAsString(jsonEncode(user.toJson()));
  }

// load file from profile
  static Future<UserModel?> loadUserProfile() async {
    try {
      final file = await getProfileFile();
      if (!file.existsSync()) {
        return null;
      }
      final jsonString = await file.readAsString();
      return UserModel.fromJson(jsonDecode(jsonString));
    } catch (e) {
      print('Failed to load profile: $e');
      return null;
    }
  }

// save image from profile
  static Future<String> saveImageToLocal(File imageFile) async {
    final directory = await getDirectoryPath();
    final fileName = 'profile_iamge.png';
    final savedImage = await imageFile.copy('$directory/$fileName');
    return savedImage.path;
  }

// Get file for favorites
  static Future<File> getFavoritesFile() async {
    final path = await getDirectoryPath();
    return File('$path/favorites.json');
  }

// Save list of favorite books
  static Future<void> saveFavorites(List<BookModel> favorites) async {
    final file = await getFavoritesFile();
    if (favorites.isEmpty) {
      if (await file.exists()) {
        await file.delete();
      }
      return;
    }
    final jsonList = favorites.map((book) => book.toJson()).toList();
    await file.writeAsString(jsonEncode(jsonList));
    print('save favourite : $jsonList');
  }

// Load favorite books
  static Future<List<BookModel>> loadFavorites() async {
    final file = await getFavoritesFile();
    if (!await file.exists()) return [];
    final content = await file.readAsString();
    final List<dynamic> jsonList = jsonDecode(content);
    print(
        ' load favourite : ${jsonList.map((e) => BookModel.fromJson(e)).toList()}');
    return jsonList.map((e) => BookModel.fromJson(e)).toList();
  }

  // Remove a single book from favorites by ID
  static Future<void> removeFavorite(String bookId) async {
    final favorites = await loadFavorites();

    favorites.removeWhere((book) => book.id == bookId);

    await saveFavorites(favorites);
  }
}
