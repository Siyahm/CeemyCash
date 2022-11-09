import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

import 'package:my_wallet/screens/add_screen/model/transaction_model.dart';

const transactionDbName = 'transaction_db';

class TransactionDB {
  TransactionDB._internal();

  static TransactionDB instance = TransactionDB._internal();

  factory TransactionDB() {
    return instance;
  }

  List<TransactionModel> transactionListNotifier = [];

  final String todayDate = DateFormat('yMMMMd').format(DateTime.now());
  final DateTime weekDate = DateTime.now().subtract(const Duration(days: 7));
  final DateTime monthDate = DateTime.now().subtract(const Duration(days: 30));
  final DateTime yearDate = DateTime.now().subtract(const Duration(days: 360));

  Future<void> addTransaction(TransactionModel obj) async {
    final transactionDB =
        await Hive.openBox<TransactionModel>(transactionDbName);
    await transactionDB.put(obj.id, obj);
  }

  Future<List<TransactionModel>> getAllTransactions() async {
    final transactionDB =
        await Hive.openBox<TransactionModel>(transactionDbName);
    return transactionDB.values.toList();
  }

  Future<List<TransactionModel>> refreshUi() async {
    final getAllTransactionList = await getAllTransactions();
    getAllTransactionList.sort((firstDate, lastDate) =>
        lastDate.transactionDate.compareTo(firstDate.transactionDate));
    transactionListNotifier.clear();
    transactionListNotifier.addAll(getAllTransactionList);
    return transactionListNotifier;
  }

  Future<List<TransactionModel>> sortedTransaction() async {
    final allTransactions = await TransactionDB.instance.getAllTransactions();
    allTransactions.sort((secondTransaction, firstTransaction) =>
        firstTransaction.transactionDate
            .compareTo(secondTransaction.transactionDate));
    return allTransactions;
  }
}
