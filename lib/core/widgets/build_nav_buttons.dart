import 'package:flutter/material.dart';

Widget buildNavButton(BuildContext context, String text, VoidCallback onPressed) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
    child: TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: const Size(20, 20),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}