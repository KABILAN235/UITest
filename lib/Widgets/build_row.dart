import 'package:flutter/material.dart';

Widget buildRow(String text, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Icon(icon), const SizedBox(width: 10), Text(text)],
    ),
  );
}
