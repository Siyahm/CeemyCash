import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_wallet/models/category/category_model.dart';

const categoryDbName = 'category_database';

abstract class CategoryDbFunctions {
  Future<List<CategoryModel>> getCategories();
  Future<void> insertCategory(CategoryModel value);
  Future<void> deleteCategory(String categoryId);
}

class CategoryDB implements CategoryDbFunctions {
  CategoryDB._internal();

  static CategoryDB instance = CategoryDB._internal();

  factory CategoryDB() {
    return instance;
  }

  ValueNotifier<List<CategoryModel>> incomeCategoryListener = ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> expenseCategoryListener =
      ValueNotifier([]);

  @override
  Future<void> insertCategory(CategoryModel value) async {
    final categoryDB = await Hive.openBox<CategoryModel>(categoryDbName);
    categoryDB.put(value.id, value);
    refreshUI();
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final categoryDB = await Hive.openBox<CategoryModel>(categoryDbName);
    return categoryDB.values.toList();
  }

  Future<void> refreshUI() async {
    final getAllCategories = await getCategories();
    incomeCategoryListener.value.clear();
    expenseCategoryListener.value.clear();
    await Future.forEach(
      getAllCategories,
      (CategoryModel category) {
        if (category.type1 == CategoryType.income) {
          incomeCategoryListener.value.add(category);
        } else {
          expenseCategoryListener.value.add(category);
        }
      },
    );
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    incomeCategoryListener.notifyListeners();
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    expenseCategoryListener.notifyListeners();
  }

  @override
  Future<void> deleteCategory(String categoryId) async {
    final categoryDB = await Hive.openBox<CategoryModel>(categoryDbName);
    await categoryDB.delete(categoryId);
    refreshUI();
  }
}
