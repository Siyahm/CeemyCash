import 'package:flutter/material.dart';
import 'package:my_wallet/db_functions/transactions/transaction_db.dart';
import 'package:my_wallet/screens/categories_screen/view/categories.dart';
import 'package:my_wallet/screens/chart.dart';
import 'package:my_wallet/screens/home_screen/view/home.dart';
import 'package:my_wallet/screens/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenProvider with ChangeNotifier {
  Map<String, double> transactionGraph = {
    'Income': TransactionDB.instance.totalIncome.value,
    'Expense': TransactionDB.instance.totalExpense.value,
  };

  bool isVisible = true;
  int selectedPageIndex = 0;

  final pageOptions = [
    const ScreenHome(),
    const ScreenCategories(),
    const ScreenChart(),
    const ScreenSettings(),
  ];

  void onItemTaped(index) {
    selectedPageIndex = index;
    if (selectedPageIndex != 0) {
      isVisible = false;
    } else {
      isVisible = true;
    }
    notifyListeners();
  }

  bool willPopOnTap() {
    if (selectedPageIndex != 0) {
      selectedPageIndex = 0;
      isVisible = true;

      return false;
    }
    return true;
  }

  void iniStateCall() {
    savedName();
    notifyListeners();
  }

  final GlobalKey<ScaffoldState> key = GlobalKey();

  String userEnteredName = '';

  Future<void> savedName() async {
    final name = await SharedPreferences.getInstance();
    final nameOfUser = name.getString('usrnameKey');
    userEnteredName = nameOfUser.toString();
    notifyListeners();
  }

  // Future<void> refreshWidgetUI() async {
  //   await TransactionDB.instance.refreshUI();
  //   notifyListeners();
  // }

  // void homeUIRefresh() {
  //   TransactionDB.instance.refreshUI();
  // }
}
