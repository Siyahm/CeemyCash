import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:my_wallet/screens/categories_screen/controller/categories_provider.dart';
import 'package:provider/provider.dart';

class AddCategoryFunction {
  Widget addCategory(
    context,
    formkey,
  ) {
    final categoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    return AlertDialog(
      title: categoriesProvider.tabController.index == 0
          ? const Text('Add Income Categgory')
          : const Text('Add Expense Categgory'),
      content: Form(
        key: formkey,
        child: TextFormField(
          validator: (value) => categoriesProvider.categoryValidator(value!),
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
      ),
      actions: [
        TextButton(
          onPressed: () {
            categoriesProvider.categoryCancelButtonPressed(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            categoriesProvider.categorySaveButtonPressed(context);
            categoriesProvider.categoriesRefresh();
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
