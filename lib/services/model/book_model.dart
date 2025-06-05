import 'package:flutter/material.dart';

class BookModel {
  final String id;
  final String title;
  final String author;
  final String description;
  final String category;
  final int pageCount;
  final String printType;
  final double averageRating;
  final String thumbnail;
  final String language;
  final String previewLink;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.category,
    required this.pageCount,
    required this.printType,
    required this.averageRating,
    required this.thumbnail,
    required this.language,
    required this.previewLink,
  });

  // ✅ Parse from API (volumeInfo format)
  factory BookModel.fromApiJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'] ?? {};
    final noThumbnailImage =
        'https://imgs.search.brave.com/S4x0to1Mk1bW3RKrhxVv8W3K2xxjjKalG0PoyqDEG3o/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy82/LzY1L05vLUltYWdl/LVBsYWNlaG9sZGVy/LnN2Zw';

    return BookModel(
      id: json['id'] ?? UniqueKey().toString(),
      title: volumeInfo['title'] ?? 'No Title',
      author: (volumeInfo['authors'] as List?)?.join(', ') ?? 'Unknown Author',
      description: volumeInfo['description'] ?? 'No description available',
      category: (volumeInfo['categories'] as List?)?.join(', ') ?? 'Unknown',
      pageCount: volumeInfo['pageCount'] ?? 0,
      printType: volumeInfo['printType'] ?? 'Unknown',
      averageRating: (volumeInfo['averageRating'] as num?)?.toDouble() ?? 0.0,
      thumbnail: volumeInfo['imageLinks']?['thumbnail'] ?? noThumbnailImage,
      language: volumeInfo['language'] ?? 'Unknown',
      previewLink: volumeInfo['previewLink'] ?? '',
    );
  }

  // ✅ Parse from local storage (flat format)
  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'] ?? '',
      title: json['title'] ?? 'No Title',
      author: json['author'] ?? 'Unknown Author',
      description: json['description'] ?? 'No description available',
      category: json['category'] ?? 'Unknown',
      pageCount: json['pageCount'] ?? 0,
      printType: json['printType'] ?? 'Unknown',
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0.0,
      thumbnail: json['thumbnail'] ??
          'https://imgs.search.brave.com/S4x0to1Mk1bW3RKrhxVv8W3K2xxjjKalG0PoyqDEG3o/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy82/LzY1L05vLUltYWdl/LVBsYWNlaG9sZGVy/LnN2Zw',
      language: json['language'] ?? 'Unknown',
      previewLink: json['previewLink'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'author': author,
        'description': description,
        'category': category,
        'pageCount': pageCount,
        'printType': printType,
        'averageRating': averageRating,
        'thumbnail': thumbnail,
        'language': language,
        'previewLink': previewLink,
      };

  static List<BookModel> fromApiResponse(Map<String, dynamic> json) {
    final items = json['items'] as List? ?? [];
    return items.map((item) => BookModel.fromApiJson(item)).toList();
  }
}
