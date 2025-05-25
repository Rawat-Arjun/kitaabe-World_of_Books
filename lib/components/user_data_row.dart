import 'package:flutter/material.dart';
import 'package:kitaabe/components/color_extension.dart';

class UserDataRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const UserDataRow({
    required this.icon,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          icon,
          color: TColor.primary,
          size: 30,
        ),
        SizedBox(
          width: 200,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            softWrap: true,
          ),
        )
      ],
    );
  }
}
