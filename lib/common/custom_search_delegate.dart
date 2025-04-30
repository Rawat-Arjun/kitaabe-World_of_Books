import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  final Widget Function(String query) data;
  CustomSearchDelegate({required this.data});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.filter_alt),
      ),
      IconButton(
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
        icon: Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      showSuggestions(context);
    }
    return data(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
