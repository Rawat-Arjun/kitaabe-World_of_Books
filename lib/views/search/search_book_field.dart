import 'package:flutter/material.dart';
import 'package:kitaabe/common/color_extension.dart';
import 'package:kitaabe/util/api_service.dart';
import 'package:kitaabe/views/home/book%20detail/book_detail_page.dart';

class SearchBookField extends StatefulWidget {
  const SearchBookField({super.key});

  @override
  State<SearchBookField> createState() => _SearchBookFieldState();
}

class _SearchBookFieldState extends State<SearchBookField> {
  List<String> bookTitles = [];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SearchAnchor.bar(
      barBackgroundColor: WidgetStatePropertyAll(
        TColor.primaryLight,
      ),
      barOverlayColor: WidgetStatePropertyAll(
        TColor.primaryLight,
      ),
      dividerColor: TColor.primary,
      viewBackgroundColor: TColor.primaryLight,
      barTextStyle: WidgetStatePropertyAll(
        const TextStyle(
          color: Colors.black,
        ),
      ),
      barHintText: 'Search books...',
      viewHeaderTextStyle: textTheme.bodyMedium?.copyWith(
        color: Colors.black,
      ),
      barLeading: const Icon(
        Icons.search,
        color: Colors.black,
      ),
      isFullScreen: false,
      barTrailing: const [],
      suggestionsBuilder: (context, controller) async {
        final query = controller.text.trim();

        if (query.isEmpty) {
          setState(() {
            bookTitles = [];
          });
          return <Widget>[
            SizedBox.shrink(),
          ];
        }

        try {
          final results = await ApiService().fetchBooksByQuery(query);

          if (results.isEmpty) {
            return [
              ListTile(
                title: Text(
                  'No results found',
                  style: textTheme.bodyMedium,
                ),
              ),
            ];
          }

          return results.map((book) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BookDetailPage(book: book),
                ));
              },
              child: ListTile(
                title: Text(
                  book.title,
                  style: textTheme.labelMedium?.copyWith(
                    color: TColor.text,
                  ),
                ),
                subtitle: Text(
                  book.author,
                  style: textTheme.bodySmall?.copyWith(
                    color: TColor.text,
                  ),
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    height: 200,
                    width: 50,
                    fit: BoxFit.fill,
                    book.thumbnail,
                  ),
                ),
              ),
            );
          }).toList();
        } catch (e) {
          return [
            ListTile(
              title: Text(
                'Error: ${e.toString()}',
                style: textTheme.bodyMedium,
              ),
            ),
          ];
        }
      },
    );
  }
}
