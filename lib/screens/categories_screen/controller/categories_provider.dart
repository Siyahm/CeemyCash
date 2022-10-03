import 'package:flutter/material.dart';
import 'package:my_wallet/db_functions/category/category_db.dart';
import 'package:my_wallet/screens/categories_screen/models/category_model.dart';
import 'package:my_wallet/screens/categories_screen/view/widgets/category_add_dialoguebox.dart';

class CategoriesProvider with ChangeNotifier {
  late TabController tabController;
  final nameEditignController = TextEditingController();

  final List<CategoryModel> incomeCatergoryModelList = [];
  final List<CategoryModel> expenseCategoryModelList = [];

  void categoriesIniStateCall(context) {
    tabController = TabController(length: 2, vsync: Scaffold.of(context));
    CategoryDB().refreshUI();
  }

  Future<void> floatButtonPressed(context) async {
    await showDialog(
      context: context,
      builder: (ctx) => const CategoryAddDialogueBox(),
    );
  }

  void popFunction(context) {
    Navigator.pop(context);
  }

  void categorySaveButtonPressed(context) {
    nameEditignController.text.isNotEmpty
        ? () {
            final name = nameEditignController.text.trim();

            final categoryModelObj = CategoryModel(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                name: name,
                type1: tabController.index == 0
                    ? CategoryType.income
                    : CategoryType.expense);
            CategoryDB().addtCategory(categoryModelObj);
            nameEditignController.clear();
            Navigator.of(context).pop();
          }
        : null;
  }
}
