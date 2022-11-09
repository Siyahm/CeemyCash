import 'package:flutter/material.dart';

class CustomAlertDialogBox extends StatelessWidget {
  const CustomAlertDialogBox({
    Key? key,
    required this.title,
    required this.content,
    required this.onPressed(),
  }) : super(key: key);

  final String title;
  final String content;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onPressed;
              },
              child: const Text('Yes'),
            ),
          ],
        )
      ],
    );
  }
}
