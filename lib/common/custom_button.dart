import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? minHeight;
  final double? minWidth;
  final Color color;
  final BoxShape shape;
  final BorderRadius? borderRadius;
  final Widget child;

  const CustomButton({
    super.key,
    required this.onPressed,
    this.minHeight,
    this.minWidth,
    this.borderRadius,
    required this.color,
    required this.shape,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: minHeight,
        width: minWidth,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
          shape: shape,
        ),
        child: child,
      ),
    );
  }
}
