import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/book_model.dart';

final String baseUrl = "https://www.googleapis.com/books/v1/volumes";
final String apiKey = "AIzaSyAqxw3nnCxwNQXRmXb-ZFi8FTNyhz6kwGA";

enum BookCategory { topPicks, bestSellers, trending }

extension BookCategoryExtension on BookCategory {
  String get query {
    switch (this) {
      case BookCategory.topPicks:
        return '*';
      case BookCategory.bestSellers:
        return "bestseller";
      case BookCategory.trending:
        return "trending+books";
    }
  }

  String get orderBy {
    switch (this) {
      case BookCategory.trending:
        return "newest";
      default:
        return "relevance";
    }
  }

  String? get filter {
    switch (this) {
      case BookCategory.bestSellers:
        return "paid-ebooks";
      default:
        return null;
    }
  }
}

class ApiService {
  Future<List<BookModel>> fetchBooksByQuery(String query) async {
    final url =
        Uri.parse("$baseUrl?q=${Uri.encodeComponent(query)}&key=$apiKey");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return BookModel.fromApiResponse(data);
      } else {
        throw Exception('Failed to fetch books for query');
      }
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }

  Future<List<BookModel>> fetchGenreBooks(String genre) async {
    final url = Uri.parse(
        "$baseUrl?q=subject:${Uri.encodeComponent(genre)}&key=$apiKey");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return BookModel.fromApiResponse(data);
      } else {
        throw Exception('Failed to fetch genre books');
      }
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }

  Future<List<BookModel>> fetchBooksByCategory(BookCategory category) async {
    final query = category.query;
    final orderBy = category.orderBy;
    final filter = category.filter;

    // Construct URL correctly
    String urlStr = "$baseUrl?q=${Uri.encodeComponent(query)}"
        "&orderBy=$orderBy"
        "&key=$apiKey";

    if (filter != null) {
      urlStr += "&filter=$filter";
    }

    final url = Uri.parse(urlStr);

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return BookModel.fromApiResponse(data);
      } else {
        throw Exception("Failed to fetch books for category");
      }
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}
