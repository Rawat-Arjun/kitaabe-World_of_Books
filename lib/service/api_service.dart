import 'dart:convert';

import 'package:http/http.dart' as http;

import 'book_model.dart';

class ApiService {
  final String baseUrl = "https://www.googleapis.com/books/v1/volumes";
  final String apiKey = "AIzaSyAqxw3nnCxwNQXRmXb-ZFi8FTNyhz6kwGA";
  Future<List<BookModel>> fetchBooks() async {
    final url = Uri.parse("$baseUrl?q=subject:fantasy&key=$apiKey");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['items'] != null && data['items'].isNotEmpty) {
          return BookModel.fromApiResponse(data); // ✅ Return books
        } else {
          print('No books found.');
          return []; // ✅ Return empty list safely
        }
      } else {
        throw Exception('Failed to load books');
      }
    } catch (e) {
      print('Error: $e');
      return []; // ✅ Return empty list on error
    }
  }
}
