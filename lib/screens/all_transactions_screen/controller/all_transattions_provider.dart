import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_wallet/db_functions/category/category_db.dart';
import 'package:my_wallet/db_functions/transactions/transaction_db.dart';
import 'package:my_wallet/screens/add_screen/model/transaction_model.dart';
import 'package:my_wallet/screens/add_screen/controller/add_screen_provider.dart';
import 'package:my_wallet/screens/add_screen/view/add_transaction.dart';

class AllTransactionsScreenProvider with ChangeNotifier {
  double currentBalance = 0;
  double totalIncome = 0;
  double totalExpense = 0;
  final List<TransactionModel> allData =
      TransactionDB.instance.transactionListNotifier;
  List<TransactionModel> foundData = [];
  String searchCloseIcon = '';

  List<TransactionModel> incomeTransactionListNotifier = [];
  List<TransactionModel> expenseTransactionListNotifier = [];
  List<TransactionModel> transactionListNotifier = [];

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String currentCategory = 'All';
  String currentTransaction = 'All';

  void allTransactionUIRefreshFunction() {
    TransactionDB.instance.sortedTransactions();

    foundData = allData;
    notifyListeners();
  }

  void transactionTypeFilterOnChange(String? newValue) {
    currentCategory = newValue!;

    filteredTransaction();
    notifyListeners();
  }

  List<DropdownMenuItem<String>>? transactionTypeFilterItemList() {
    List<DropdownMenuItem<String>>? typeItemList = <String>[
      'All',
      'Income',
      'Expense',
    ].map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();

    return typeItemList;
  }

  void transactionTimeFilterOnChange(String? newValues) {
    // currentCategory = newValues!;

    currentTransaction = newValues!;

    filteredTransaction();
    notifyListeners();
  }

  List<DropdownMenuItem<String>>? transactionTimeFilterItemList() {
    List<DropdownMenuItem<String>>? timeItemList = <String>[
      'All',
      'Today',
      'This Week',
      'This Month',
      'This Year',
    ].map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();

    return timeItemList;
  }

  void deleteButtonPressed(index) async {
    foundData[index].delete();
  }

  Future<void> refreshUI() async {
    final allTransactionList =
        await TransactionDB.instance.getAllTransactions();
    allTransactionList.sort(
      (first, second) =>
          second.transactionDate.compareTo(first.transactionDate),
    );
    transactionListNotifier.clear();
    transactionListNotifier.addAll(allTransactionList);

    currentBalance = 0;
    totalIncome = 0;
    totalExpense = 0;

    await Future.forEach(
      allTransactionList,
      (TransactionModel transaction) {
        if (transaction.type2 == TransactionType.incom) {
          totalIncome = totalIncome + transaction.transactionAmount;
          incomeTransactionListNotifier.add(transaction);
        } else if (transaction.type2 == TransactionType.exppense) {
          totalExpense = totalExpense + transaction.transactionAmount;
          expenseTransactionListNotifier.add(transaction);
        }
      },
    );

    currentBalance = totalIncome - totalExpense;
  }

  void editButtonPressed(index, context) {
    CategoryDB.instance.refreshUI();
    // if (foundData[index].type2 == TransactionType.incom) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddTransaction(
          type: ScreenAction.editScreen,
          transactionModel: foundData[index],
          screenType: foundData[index].type2 == TransactionType.incom
              ? ScreenType.incmeScreen
              : ScreenType.expenseScreen,
        ),
      ),
    );
    // } else {
    //   Navigator.of(context).push(
    //     MaterialPageRoute(
    //       builder: (context) => AddTransaction(
    //         type: ScreenAction.editScreen,
    //         transactionModel: foundData[index],
    //         screenType: ScreenType.expenseScreen,
    //       ),

    //     ),
    //   );
    // }
  }

  void searchTransaction(String enteredKeyword) {
    List<TransactionModel> searchedData = [];

    if (enteredKeyword.isEmpty) {
      searchedData = allData;
    } else {
      searchedData = allData
          .where((element) => element.transactionCategory.name
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    foundData = searchedData;
    enteredKeyword = searchCloseIcon;
    notifyListeners();
  }

  void filteredTransaction() {
    foundData = allData;
    List<TransactionModel> result = [];
    final todayDate = DateTime.now();
    final date = DateFormat('yMMMd').format(todayDate);
    final parsedTodayDate = DateFormat('yMMMd').parse(date).toString().trim();
    final weekDate = DateTime.now().subtract(const Duration(days: 7));
    final monthDate = DateTime.now().subtract(const Duration(days: 30));
    final yearDate = DateTime.now().subtract(const Duration(days: 365));

    if (currentTransaction == 'All' && currentCategory == 'All') {
      result = allData;
    } else if (currentTransaction == 'All' && currentCategory == 'Income') {
      result = foundData
          .where((element) => element.type2 == TransactionType.incom)
          .toList();
    } else if (currentTransaction == 'All' && currentCategory == 'Expense') {
      result = foundData
          .where((element) => element.type2 == TransactionType.exppense)
          .toList();
    } else if (currentTransaction == 'Today' && currentCategory == 'All') {
      // print('parsed date$parsedTodayDate ');

      result = foundData.where((element) {
        // print('Hello${element.transactionDate.toString().trim()}');
        return element.transactionDate.toString().trim() == parsedTodayDate;
      }).toList();
    } else if (currentTransaction == 'Today' && currentCategory == 'Income') {
      result = foundData
          .where((element) =>
              element.transactionDate.toString().trim() == parsedTodayDate &&
              element.type2 == TransactionType.incom)
          .toList();
    } else if (currentTransaction == 'Today' && currentCategory == 'Expense') {
      result = foundData
          .where((element) =>
              element.transactionDate.toString().trim() == parsedTodayDate &&
              element.type2 == TransactionType.exppense)
          .toList();
    } else if (currentTransaction == 'This Week' && currentCategory == 'All') {
      result = foundData
          .where(
            (element) => element.transactionDate.isAfter(weekDate),
          )
          .toList();
    } else if (currentTransaction == 'This Week' &&
        currentCategory == 'Income') {
      result = foundData
          .where((element) =>
              element.transactionDate.isAfter(weekDate) &&
              element.type2 == TransactionType.incom)
          .toList();
    } else if (currentTransaction == 'This Week' &&
        currentCategory == 'Expense') {
      result = foundData
          .where((element) =>
              element.transactionDate.isAfter(weekDate) &&
              element.type2 == TransactionType.exppense)
          .toList();
    } else if (currentTransaction == 'This Month' && currentCategory == 'All') {
      result = foundData
          .where(
            (element) => element.transactionDate.isAfter(monthDate),
          )
          .toList();
    } else if (currentTransaction == 'This Month' &&
        currentCategory == 'Income') {
      result = foundData
          .where((element) =>
              element.transactionDate.isAfter(monthDate) &&
              element.type2 == TransactionType.incom)
          .toList();
    } else if (currentTransaction == 'This Month' &&
        currentCategory == 'Expense') {
      result = foundData
          .where((element) =>
              element.transactionDate.isAfter(monthDate) &&
              element.type2 == TransactionType.exppense)
          .toList();
    } else if (currentTransaction == 'This Year' && currentCategory == 'All') {
      result = foundData
          .where(
            (element) => element.transactionDate.isAfter(yearDate),
          )
          .toList();
    } else if (currentTransaction == 'This Year' &&
        currentCategory == 'Income') {
      result = foundData
          .where((element) =>
              element.transactionDate.isAfter(yearDate) &&
              element.type2 == TransactionType.incom)
          .toList();
    } else if (currentTransaction == 'This Year' &&
        currentCategory == 'Expense') {
      result = foundData
          .where((element) =>
              element.transactionDate.isAfter(yearDate) &&
              element.type2 == TransactionType.exppense)
          .toList();
    }

    foundData = result;
    notifyListeners();
  }
}
