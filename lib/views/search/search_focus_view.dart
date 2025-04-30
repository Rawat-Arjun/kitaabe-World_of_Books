import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kitaabe/common/color_extension.dart';

class SearchFocusView extends StatefulWidget {
  final String query;
  const SearchFocusView({
    super.key,
    required this.query,
  });

  @override
  State<SearchFocusView> createState() => _SearchFocusViewState();
}

class _SearchFocusViewState extends State<SearchFocusView> {
  List<Map<String, dynamic>> books = [];
  final String baseUrl = "https://www.googleapis.com/books/v1/volumes";
  final String apiKey = "AIzaSyAqxw3nnCxwNQXRmXb-ZFi8FTNyhz6kwGA";

  Future<void> searchBooks(String query) async {
    if (query.isEmpty) return; // ✅ Skip empty queries

    final url = "$baseUrl?q=${Uri.encodeComponent(query)}&key=$apiKey";

    try {
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        final data = response.data;

        if (data['items'] != null && data['items'].isNotEmpty) {
          final List<Map<String, dynamic>> results = [];

          for (var item in data['items']) {
            final volumeInfo = item['volumeInfo'];

            results.add({
              'title': volumeInfo['title'] ?? 'No Title',
              'authors':
                  (volumeInfo['authors'] ?? ['Unknown Author']).join(', '),
              'thumbnail': volumeInfo['imageLinks']?['thumbnail'] ??
                  'https://via.placeholder.com/150', // Default image if no thumbnail
            });
          }

          setState(() => books = results);
        } else {
          setState(() => books = []);
        }
      } else {
        throw Exception('Failed to load books');
      }
    } catch (e) {
      print('Error: $e');
      setState(() => books = []);
    }
  }

  @override
  void initState() {
    super.initState();
    searchBooks(widget.query);
  }

  bool isCleared = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isCleared
          ? Center(
              child: Text('No Book Found !'),
            )
          : ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return Card(
                  color: TColor.primaryLight,
                  margin: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  child: ListTile(
                    onTap: () {},
                    focusColor: TColor.primary,
                    contentPadding: const EdgeInsets.all(10),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        book['thumbnail'],
                        width: 60,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      book['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      'Author(s): ${book['authors']}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
