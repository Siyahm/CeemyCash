import 'package:flutter/material.dart';

class AddCategoryPopup extends StatefulWidget {
  const AddCategoryPopup({Key? key}) : super(key: key);

  @override
  State<AddCategoryPopup> createState() => _AddCategoryPopupState();
}

class _AddCategoryPopupState extends State<AddCategoryPopup> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<void> addIncomeCategoryPopup(BuildContext context) async {
    final nameEditignController = TextEditingController();
    // bool isButtonActive = false;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Income Categgory'),
        content: TextFormField(
          controller: nameEditignController,
          decoration: InputDecoration(
            hintText: 'Enter category name',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: nameEditignController.text.isNotEmpty
                ? () {
                    // final name = nameEditignController.text.trim();
                  }
                : null,
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Future<void> addExpenseCategoryPopup(BuildContext context) async {
    final nameEditignController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Income2 Categgory'),
        content: TextFormField(
          controller: nameEditignController,
          decoration: InputDecoration(
            hintText: 'Enter category name',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: nameEditignController.text.isNotEmpty
                ? () {
                    // final name = nameEditignController.text.trim();
                  }
                : null,
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
