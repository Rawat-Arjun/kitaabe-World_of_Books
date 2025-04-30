import 'package:flutter/material.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.favorite,
          color: Colors.pinkAccent,
          size: 30,
        ),
      ),
    );
  }
}
