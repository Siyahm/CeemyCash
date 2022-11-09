import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_wallet/db_functions/category/category_db.dart';
import 'package:my_wallet/db_functions/transactions/transaction_db.dart';
import 'package:my_wallet/screens/about_screen/view/about_acreen.dart';
import 'package:my_wallet/screens/add_screen/model/transaction_model.dart';
import 'package:my_wallet/screens/categories_screen/models/category_model.dart';
import 'package:my_wallet/screens/splash_screen/view/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  bool switchOn = true;

  void onTapSwitch(bool newValue) {
    switchOn = newValue;
    notifyListeners();
  }

  Future<void> resetAllData(BuildContext context) async {
    final deleteCategory = await Hive.openBox<CategoryModel>(categoryDbName);
    deleteCategory.deleteFromDisk();

    final deleteAllTransactions =
        await Hive.openBox<TransactionModel>(transactionDbName);
    deleteAllTransactions.deleteFromDisk();

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    // if (!mounted) {}
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const ScreenSplash(),
      ),
    );
  }

  Future<void> resetAllTransactions() async {
    final deleteAllTransactions =
        await Hive.openBox<TransactionModel>(transactionDbName);
    deleteAllTransactions.deleteFromDisk();
    //await TransactionDB.instance.refreshUI();
  }

  void onClickAboutUs(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ScreenAboutUs(),
      ),
    );
  }
}
