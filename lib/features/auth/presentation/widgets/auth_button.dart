import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final Widget text;
  final VoidCallback? onTap;
  final Widget? image;
  final Color? backgroundColor;

  const AuthButton({
    super.key,
    required this.text,
    this.onTap,
    this.image,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Material(
      color: backgroundColor ?? Color(0xFFF2F2F0),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        splashColor: primaryColor.withValues(alpha: 0.1), 
        highlightColor: primaryColor.withValues(alpha: 0.05), 
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: primaryColor,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image != null) ...[
                image!,
                const SizedBox(width: 12),
              ],
              text,
            ],
          ),
        ),
      ),
    );
  }
}