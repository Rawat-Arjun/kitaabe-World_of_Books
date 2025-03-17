import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaabe/common/color_extension.dart';

class SearchFocusView extends StatefulWidget {
  const SearchFocusView({super.key});

  @override
  State<SearchFocusView> createState() => _SearchFocusViewState();
}

class _SearchFocusViewState extends State<SearchFocusView> {
  final TextEditingController searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  List<String> searchHistory = [];

  void _submitSearch(String query) {
    if (query.isNotEmpty && !searchHistory.contains(query)) {
      setState(() {
        searchHistory.insert(0, query); // Add new search at the top
      });
    }
    searchController.clear(); // Clear input field after submission
    _focusNode.unfocus(); // Hide keyboard
  }

  void _deleteSearch(String query) {
    setState(() {
      searchHistory.remove(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          cursorColor: TColor.primary,
          controller: searchController,
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: "Search",
            border: UnderlineInputBorder(),
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () => searchController.clear(),
            ),
          ),
          onSubmitted: _submitSearch, // handle search submission
          onTapOutside: (event) {
            _focusNode.unfocus(); // unfocus search field
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (searchHistory.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    Text(
                      "Recent Searches",
                      style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          searchHistory.clear(); // clear all searches
                        });
                      },
                      child: Text(
                        'Clear All',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: TColor.primary,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: searchHistory.length,
                  itemBuilder: (context, index) {
                    final query = searchHistory[index];
                    return Card(
                      color: TColor.primaryLight,
                      child: ListTile(
                        leading: const Icon(Icons.history),
                        title: Text(
                          query,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                          ),
                        ),
                        onTap: () {
                          searchController.text = query;
                        },
                        trailing: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => _deleteSearch(query),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
