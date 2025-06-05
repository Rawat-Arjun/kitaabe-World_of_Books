import 'package:flutter/material.dart';
import 'color_extension.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final bool isObsecureText;
  final int? maxlines;
  final int? maxLength;
  final IconButton? suffixIcon;
  final IconButton? prefixIcon;
  final String? Function(String?)? validator;

  const CustomTextField({
    required this.text,
    required this.controller,
    required this.keyboardType,
    super.key,
    this.maxlines,
    this.maxLength,
    this.isObsecureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObsecureText,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: TColor.primary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        hintText: text,
        hintStyle: textTheme.bodySmall,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      maxLines: maxlines,
      maxLength: maxLength,
      cursorColor: TColor.primary,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
