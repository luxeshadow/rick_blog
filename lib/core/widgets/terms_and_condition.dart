import 'package:flutter/material.dart';

class TermeAndCondition extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const TermeAndCondition({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Row(
      children: [
        Checkbox(
          value: value,
          activeColor: primaryColor,
          onChanged: onChanged,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              text: "I accept the ",
              style: Theme.of(context).textTheme.bodySmall,
              children: [
                TextSpan(
                  text: "Terms of Service",
                  style: TextStyle(
                    color: primaryColor,
                    decoration: TextDecoration.underline,
                    decorationColor: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: " and "),
                TextSpan(
                  text: "Privacy Policy",
                  style: TextStyle(
                    color: primaryColor,
                    decoration: TextDecoration.underline,
                    decorationColor: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: " of RickBlog."),
              ],
            ),
          ),
        ),
      ],
    );
  }
}