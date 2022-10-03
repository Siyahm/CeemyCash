import 'package:hive_flutter/adapters.dart';
import 'package:my_wallet/screens/categories_screen/controller/categories_provider.dart';
import 'package:my_wallet/screens/categories_screen/models/category_model.dart';

const categoryDbName = 'category_database';

abstract class CategoryDbFunctions {
  Future<List<CategoryModel>> getAllCategories();
  Future<void> addtCategory(CategoryModel value);
  Future<void> deleteCategory(String categoryId);
}

class CategoryDB implements CategoryDbFunctions {
  CategoryDB._internal();

  static CategoryDB instance = CategoryDB._internal();

  factory CategoryDB() {
    return instance;
  }

  @override
  Future<void> addtCategory(
    CategoryModel value,
  ) async {
    final categoryDB = await Hive.openBox<CategoryModel>(categoryDbName);
    categoryDB.put(value.id, value);
    refreshUI();
  }

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final categoryDB = await Hive.openBox<CategoryModel>(categoryDbName);
    return categoryDB.values.toList();
  }

  Future<void> refreshUI() async {
    final getAllCategory = await getAllCategories();
    CategoriesProvider().incomeCatergoryModelList.clear();
    CategoriesProvider().expenseCategoryModelList.clear();
    await Future.forEach(
      getAllCategory,
      (CategoryModel category) {
        if (category.type1 == CategoryType.income) {
          CategoriesProvider().incomeCatergoryModelList.add(category);
        } else {
          CategoriesProvider().expenseCategoryModelList.add(category);
        }
      },
    );
  }

  @override
  Future<void> deleteCategory(String categoryId) async {
    final categoryDB = await Hive.openBox<CategoryModel>(categoryDbName);
    await categoryDB.delete(categoryId);
    refreshUI();
  }
}
