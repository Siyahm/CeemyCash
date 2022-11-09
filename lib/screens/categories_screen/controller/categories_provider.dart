import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_wallet/db_functions/category/category_db.dart';
import 'package:my_wallet/screens/categories_screen/models/category_model.dart';
import 'package:my_wallet/screens/categories_screen/view/widgets/category_add_dialoguebox.dart';
import 'package:my_wallet/widgets/custom_snackbar.dart';

class CategoriesProvider with ChangeNotifier {
  late TabController tabController;
  final nameEditignController = TextEditingController();

  final List<CategoryModel> incomeCatergoryModelList = [];
  final List<CategoryModel> expenseCategoryModelList = [];
  final formKey = GlobalKey<FormState>();

  // final categoryy = incomeCategoriesList[index];
  bool isLoading = true;

  Future<void> categoriesRefresh() async {
    isLoading = true;
    final allCategories = await CategoryDB().refreshUI();
    incomeCatergoryModelList.clear();
    expenseCategoryModelList.clear();
    await Future.forEach(
      allCategories,
      (CategoryModel category) {
        if (category.type1 == CategoryType.income) {
          incomeCatergoryModelList.add(category);
        } else {
          expenseCategoryModelList.add(category);
        }
      },
    );
    isLoading = false;
    notifyListeners();
  }

  Future<void> floatButtonPressed(context) async {
    await showDialog(
      context: context,
      builder: (ctx) => AddCategoryFunction().addCategory(context, formKey),
    );
  }

  void popFunction(context) {
    Navigator.pop(context);
  }

  String? categoryValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a category name';
    } else if (tabController.index == 0) {
      final incomeCategoryItem = incomeCatergoryModelList
          .map((e) => e.name.trim().toLowerCase())
          .toList();
      if (incomeCategoryItem.contains(
        nameEditignController.text.trim().toLowerCase(),
      )) {
        return 'Income Category already exist';
      }
    } else if (tabController.index == 1) {
      final expenseCategoryItem = expenseCategoryModelList
          .map((e) => e.name.trim().toLowerCase())
          .toList();
      if (expenseCategoryItem.contains(
        nameEditignController.text.trim().toLowerCase(),
      )) {
        return 'Expense Category already exist';
      }
    }
    notifyListeners();
    return null;
  }

  void categorySaveButtonPressed(context) async {
    if (formKey.currentState!.validate()) {
      final name = nameEditignController.text.trim();

      final categoryModelObj = CategoryModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          name: name,
          type1: tabController.index == 0
              ? CategoryType.income
              : CategoryType.expense);

      await CategoryDB().addtCategory(categoryModelObj);
      log('pre');
      nameEditignController.clear();
      Navigator.of(context).pop();
      CategoryDB.instance.refreshUI();
    } else {
      null;
    }

    notifyListeners();
  }

  void categoryCancelButtonPressed(context) {
    popFunction(context);
    nameEditignController.clear();
  }

  Future<void> deleteYesButtonPressed(context, String id) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Do you want to delete the category ?'),
        content: const Text('our category will be deleted permenentlyY'),
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
                onPressed: () async {
                  await CategoryDB.instance.deleteCategory(id);
                  // incomeCatergoryModelList.removeAt(index);
                  Navigator.pop(context);
                  await CategoryDB.instance.refreshUI();

                  await customSnackBar(
                      context, 'Category deleted successfully');

                  notifyListeners();
                },
                child: const Text('Yes'),
              ),
            ],
          )
        ],
      ),
    );
    log('UI refresh');
    await CategoryDB.instance.refreshUI();
    notifyListeners();
  }
}
