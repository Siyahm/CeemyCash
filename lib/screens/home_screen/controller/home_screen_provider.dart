import 'package:flutter/material.dart';
import 'package:my_wallet/db_functions/transactions/transaction_db.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenProvider with ChangeNotifier {
  Map<String, double> transactionGraph = {
    'Income': TransactionDB.instance.totalIncome.value,
    'Expense': TransactionDB.instance.totalExpense.value,
  };

  void iniStateCall() {
    savedName();
    TransactionDB.instance.refreshUI();
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

  Future<void> refreshWidgetUI() async {
    await TransactionDB.instance.refreshUI();
    notifyListeners();
  }
}
