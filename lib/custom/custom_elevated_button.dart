// Define a reusable button widget that accepts text, background color, and text color
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  CustomElevatedButton({
    required this.buttonText,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor, // Background color
        foregroundColor: textColor, // Text color
      ),
      child: Text(buttonText),
    );
  }
}
