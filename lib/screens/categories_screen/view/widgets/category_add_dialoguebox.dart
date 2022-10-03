import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wallet/screens/categories_screen/controller/categories_provider.dart';
import 'package:provider/provider.dart';

class CategoryAddDialogueBox extends StatelessWidget {
  const CategoryAddDialogueBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<CategoriesProvider>(context);
    return AlertDialog(
      title: categoriesProvider.tabController.index == 0
          ? const Text('Add Income Categgory')
          : const Text('Add Expense Categgory'),
      content: TextFormField(
        controller: categoriesProvider.nameEditignController,
        decoration: InputDecoration(
          hintText: 'Enter category name',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.w),
            borderRadius: BorderRadius.circular(15.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.w),
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            categoriesProvider.popFunction(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            categoriesProvider.categorySaveButtonPressed(context);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
