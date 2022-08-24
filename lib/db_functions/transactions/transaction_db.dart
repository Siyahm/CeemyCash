import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

import 'package:my_wallet/models/transactions/transaction_model.dart';

const transactionDbName = 'transaction_db';

abstract class TransactionDbFunctions {
  Future<void> addTransaction(TransactionModel obj);
  Future<List<TransactionModel>> getAllTransactions();
  Future<void> sortedTransactions();
}

class TransactionDB implements TransactionDbFunctions {
  TransactionDB._internal();

  static TransactionDB instance = TransactionDB._internal();

  factory TransactionDB() {
    return instance;
  }

  ValueNotifier<List<TransactionModel>> transactionListNotifier =
      ValueNotifier([]);
  ValueNotifier<List<TransactionModel>> incomeTransactionListNotifier =
      ValueNotifier([]);
  ValueNotifier<List<TransactionModel>> expenseTransactionListNotifier =
      ValueNotifier([]);

  ValueNotifier<List<TransactionModel>> allDaytransactionNotifier =
      ValueNotifier([]);

  // ValueNotifier<List<TransactionModel>> todayAlltransactionNotifier =
  //     ValueNotifier([]);

  ValueNotifier<double> currentBalance = ValueNotifier(0);
  ValueNotifier<double> totalIncome = ValueNotifier(0);
  ValueNotifier<double> totalExpense = ValueNotifier(0);

  final String todayDate = DateFormat('yMMMMd').format(DateTime.now());
  final DateTime weekDate = DateTime.now().subtract(const Duration(days: 7));
  final DateTime monthDate = DateTime.now().subtract(const Duration(days: 30));
  final DateTime yearDate = DateTime.now().subtract(const Duration(days: 360));
  @override
  Future<void> addTransaction(TransactionModel obj) async {
    final transactionDB =
        await Hive.openBox<TransactionModel>(transactionDbName);
    await transactionDB.put(obj.id, obj);

    await refreshUI();
  }

  Future<void> refreshUI() async {
    final allTransactionList = await getAllTransactions();
    allTransactionList.sort(
      (first, second) =>
          second.transactionDate.compareTo(first.transactionDate),
    );
    transactionListNotifier.value.clear();
    transactionListNotifier.value.addAll(allTransactionList);
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    transactionListNotifier.notifyListeners();

    incomeTransactionListNotifier.value.clear();
    expenseTransactionListNotifier.value.clear();

    currentBalance.value = 0;
    totalIncome.value = 0;
    totalExpense.value = 0;

    await Future.forEach(
      allTransactionList,
      (TransactionModel transaction) {
        if (transaction.type2 == TransactionType.incom) {
          totalIncome.value = totalIncome.value + transaction.transactionAmount;
          incomeTransactionListNotifier.value.add(transaction);
        } else if (transaction.type2 == TransactionType.exppense) {
          totalExpense.value =
              totalExpense.value + transaction.transactionAmount;
          expenseTransactionListNotifier.value.add(transaction);
        }

        // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
        incomeTransactionListNotifier.notifyListeners();
        // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
        expenseTransactionListNotifier.notifyListeners();
      },
    );

    currentBalance.value = totalIncome.value - totalExpense.value;
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    currentBalance.notifyListeners();
    totalIncome.notifyListeners();
    totalExpense.notifyListeners();
  }

  @override
  Future<List<TransactionModel>> getAllTransactions() async {
    final transactionDB =
        await Hive.openBox<TransactionModel>(transactionDbName);
    return transactionDB.values.toList();
  }

  @override
  Future<void> sortedTransactions() async {
    final allTransactions = await TransactionDB.instance.getAllTransactions();
    allTransactions.sort((secondTransaction, firstTransaction) =>
        firstTransaction.transactionDate
            .compareTo(secondTransaction.transactionDate));

    refreshUI();
  }
}
