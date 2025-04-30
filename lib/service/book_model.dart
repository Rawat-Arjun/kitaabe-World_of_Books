class BookModel {
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

  // factory BookModel.fromJson(Map<String, dynamic> json) {
  //   final noThumbnailImage =
  //     'https://imgs.search.brave.com/S4x0to1Mk1bW3RKrhxVv8W3K2xxjjKalG0PoyqDEG3o/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy82/LzY1L05vLUltYWdl/LVBsYWNlaG9sZGVy/LnN2Zw';
  //   final volumeInfo = json['volumeInfo'] ?? {};
  //   return BookModel(
  //     title: volumeInfo['title'] ?? 'No Title',
  //     author: (volumeInfo['authors'] as List?)?.join(',') ?? 'Anonymous Author',
  //     description:
  //         volumeInfo['description'] ?? 'No description',
  //     category: volumeInfo['categories'],
  //     pageCount: volumeInfo['pageCount'] ?? 'IDK -_-',
  //     printType: volumeInfo['printType'],
  //     averageRating: volumeInfo['averageRating'] ?? 0.0,
  //     thumbnail: volumeInfo['imageLinks']?['thumbnail'] ?? noThumbnailImage,
  //     language: volumeInfo['language'] ?? 'IDK -_-',
  //     previewLink: volumeInfo['previewLink'] ?? '',
  //   );
  // }

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'] ?? {};
    final noThumbnailImage =
        'https://imgs.search.brave.com/S4x0to1Mk1bW3RKrhxVv8W3K2xxjjKalG0PoyqDEG3o/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy82/LzY1L05vLUltYWdl/LVBsYWNlaG9sZGVy/LnN2Zw';

    return BookModel(
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

  // Parse the entire API response (list of books)
  static List<BookModel> fromApiResponse(Map<String, dynamic> json) {
    final items = json['items'] as List? ?? [];
    return items.map((item) => BookModel.fromJson(item)).toList();
  }
}
