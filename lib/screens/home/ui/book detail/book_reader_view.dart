import 'package:flutter/material.dart';
import 'package:kitaabe/services/model/book_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookReaderView extends StatefulWidget {
  final BookModel book;
  const BookReaderView({
    required this.book,
    super.key,
  });

  @override
  State<BookReaderView> createState() => _BookReaderViewState();
}

class _BookReaderViewState extends State<BookReaderView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    String previewLink =
        widget.book.previewLink.replaceFirst('http://', 'https://');
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(previewLink),
      );
    print("Preview link: ${widget.book.previewLink}");
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.book.title,
          style: textTheme.titleLarge,
        ),
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
