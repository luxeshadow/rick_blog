import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final String? Function(String?)? validator; 
  final void Function(String)? onChanged;

  const AuthField({
    super.key,
    required this.labelText,
    this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.validator,
    this.onChanged, 
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      controller: controller,
      validator: validator, 
      onChanged: onChanged, 
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: prefixIcon,
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}