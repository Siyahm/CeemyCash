import 'package:flutter/material.dart';

customSnackBar(context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      content: Text(
        title,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.green,
    ),
  );
}
