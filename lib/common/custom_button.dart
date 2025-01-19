import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? minHeight;
  final double? minWidth;

  final BoxDecoration? boxDecoration;
  final Widget child;

  const CustomButton({
    super.key,
    this.minHeight,
    this.minWidth,
    this.boxDecoration,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: minHeight,
        width: minWidth,
        decoration: boxDecoration,
        child: child,
      ),
    );
  }
}
