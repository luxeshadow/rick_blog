import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField({super.key,required this.hintText, required this.prefixIcon, this.suffixIcon});
  final String hintText;
  final Icon prefixIcon;
  final Icon? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}