// import 'dart:developer';

// import 'package:flutter/cupertino.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:intl/intl.dart';
// import 'package:my_wallet/models/category/category_model.dart';

// import 'package:my_wallet/models/transactions/transaction_model.dart';

// const transactionDbName = 'transaction_db';

// abstract class TransactionDbFunctions {
//   Future<void> addTransaction(TransactionModel obj);
//   Future<List<TransactionModel>> getAllTransactions();
//   Future<void> sortedTransactions();
// }

// class TransactionDB implements TransactionDbFunctions {
//   TransactionDB._internal();

//   static TransactionDB instance = TransactionDB._internal();

//   factory TransactionDB() {
//     return instance;
//   }

//   ValueNotifier<List<TransactionModel>> transactionListNotifier =
//       ValueNotifier([]);
//   ValueNotifier<List<TransactionModel>> incomeTransactionListNotifier =
//       ValueNotifier([]);
//   ValueNotifier<List<TransactionModel>> expenseTransactionListNotifier =
//       ValueNotifier([]);

//   ValueNotifier<List<TransactionModel>> allDaytransactionNotifier =
//       ValueNotifier([]);

//   ValueNotifier<List<TransactionModel>> todayAlltransactionNotifier =
//       ValueNotifier([]);
//   ValueNotifier<List<TransactionModel>> todayIncometransactionNotifier =
//       ValueNotifier([]);
//   ValueNotifier<List<TransactionModel>> todayExpensetransactionNotifier =
//       ValueNotifier([]);

//   ValueNotifier<List<TransactionModel>> thisWeekAlltransactionNotifier =
//       ValueNotifier([]);
//   ValueNotifier<List<TransactionModel>> thisWeekIncometransactionNotifier =
//       ValueNotifier([]);
//   ValueNotifier<List<TransactionModel>> thisWeekExpensetransactionNotifier =
//       ValueNotifier([]);

//   ValueNotifier<List<TransactionModel>> thisMonthAlltransactionNotifier =
//       ValueNotifier([]);
//   ValueNotifier<List<TransactionModel>> thisMonthIncometransactionNotifier =
//       ValueNotifier([]);
//   ValueNotifier<List<TransactionModel>> thisMonthExpensetransactionNotifier =
//       ValueNotifier([]);

//   ValueNotifier<List<TransactionModel>> thisYearhAlltransactionNotifier =
//       ValueNotifier([]);
//   ValueNotifier<List<TransactionModel>> thisYearhIncometransactionNotifier =
//       ValueNotifier([]);
//   ValueNotifier<List<TransactionModel>> thisYearhExpensetransactionNotifier =
//       ValueNotifier([]);

//   ValueNotifier<double> currentBalance = ValueNotifier(0);
//   ValueNotifier<double> totalIncome = ValueNotifier(0);
//   ValueNotifier<double> totalExpense = ValueNotifier(0);

//   final String todayDate = DateFormat('yMMMMd').format(DateTime.now());
//   final DateTime weekDate = DateTime.now().subtract(const Duration(days: 7));
//   final DateTime monthDate = DateTime.now().subtract(const Duration(days: 30));
//   final DateTime yearDate = DateTime.now().subtract(const Duration(days: 360));
//   @override
//   Future<void> addTransaction(TransactionModel obj) async {
//     print('ad called');
//     final transactionDB =
//         await Hive.openBox<TransactionModel>(transactionDbName);
//     await transactionDB.put(obj.id, obj);

//     await refreshUI();
//   }

//   Future<void> refreshUI() async {
//     final allTransactionList = await getAllTransactions();
//     allTransactionList.sort(
//       (first, second) =>
//           second.transactionDate.compareTo(first.transactionDate),
//     );
//     transactionListNotifier.value.clear();
//     transactionListNotifier.value.addAll(allTransactionList);
//     transactionListNotifier.notifyListeners();

//     incomeTransactionListNotifier.value.clear();
//     expenseTransactionListNotifier.value.clear();

//     currentBalance.value = 0;
//     totalIncome.value = 0;
//     totalExpense.value = 0;

//     await Future.forEach(
//       allTransactionList,
//       (TransactionModel transaction) {
//         if (transaction.type2 == TransactionType.incom) {
//           totalIncome.value = totalIncome.value + transaction.transactionAmount;
//           incomeTransactionListNotifier.value.add(transaction);
//         } else if (transaction.type2 == TransactionType.exppense) {
//           totalExpense.value =
//               totalExpense.value + transaction.transactionAmount;
//           expenseTransactionListNotifier.value.add(transaction);
//         }

//         incomeTransactionListNotifier.notifyListeners();
//         expenseTransactionListNotifier.notifyListeners();
//       },
//     );

//     currentBalance.value = totalIncome.value - totalExpense.value;
//     currentBalance.notifyListeners();
//   }

//   @override
//   Future<List<TransactionModel>> getAllTransactions() async {
//     final transactionDB =
//         await Hive.openBox<TransactionModel>(transactionDbName);
//     return transactionDB.values.toList();
//   }

//   @override
//   Future<void> sortedTransactions() async {
//     final allTransactions = await TransactionDB.instance.getAllTransactions();
//     allTransactions.sort((firstTransaction, secondTransaction) =>
//         secondTransaction.transactionDate
//             .compareTo(firstTransaction.transactionDate));
//     allDaytransactionNotifier.value.clear();
//     todayAlltransactionNotifier.value.clear();
//     todayIncometransactionNotifier.value.cast();
//     todayExpensetransactionNotifier.value.cast();
//     thisWeekAlltransactionNotifier.value.cast();
//     thisWeekIncometransactionNotifier.value.clear();
//     thisWeekExpensetransactionNotifier.value.clear();
//     thisMonthAlltransactionNotifier.value.clear();
//     thisMonthIncometransactionNotifier.value.clear();
//     thisMonthExpensetransactionNotifier.value.clear();
//     thisYearhAlltransactionNotifier.value.clear();
//     thisYearhIncometransactionNotifier.value.clear();
//     thisYearhExpensetransactionNotifier.value.clear();

//     Future.forEach(
//       allTransactions,
//       (TransactionModel transaction) {
//         final DateTime todaySortedDate = DateFormat('yMMMMd').parse(todayDate);

//         if (transaction.transactionDate == todaySortedDate &&
//             transaction.type2 == CategoryType.income) {
//           allDaytransactionNotifier.value.add(transaction);
//           todayAlltransactionNotifier.value.add(transaction);
//           todayIncometransactionNotifier.value.add(transaction);
//         }

//         if (transaction.transactionDate == todaySortedDate &&
//             transaction.type2 == CategoryType.expense) {
//           allDaytransactionNotifier.value.add(transaction);
//           todayAlltransactionNotifier.value.add(transaction);
//           todayExpensetransactionNotifier.value.add(transaction);
//         }

//         if (transaction.transactionDate.isAfter(weekDate) &&
//             transaction.type2 == CategoryType.income) {
//           allDaytransactionNotifier.value.add(transaction);
//           thisWeekAlltransactionNotifier.value.add(transaction);
//           thisWeekIncometransactionNotifier.value.add(transaction);
//         }
//         if (transaction.transactionDate.isAfter(weekDate) &&
//             transaction.type2 == CategoryType.expense) {
//           allDaytransactionNotifier.value.add(transaction);
//           thisWeekAlltransactionNotifier.value.add(transaction);
//           thisWeekExpensetransactionNotifier.value.add(transaction);
//         }

//         if (transaction.transactionDate.isAfter(monthDate) &&
//             transaction.type2 == CategoryType.income) {
//           allDaytransactionNotifier.value.add(transaction);
//           thisMonthAlltransactionNotifier.value.add(transaction);
//           thisMonthIncometransactionNotifier.value.add(transaction);
//         } else if (transaction.transactionDate.isAfter(monthDate) &&
//             transaction.type2 == CategoryType.expense) {
//           allDaytransactionNotifier.value.add(transaction);
//           thisMonthAlltransactionNotifier.value.add(transaction);
//           thisMonthExpensetransactionNotifier.value.add(transaction);
//         }

//         if (transaction.transactionDate.isAfter(yearDate) &&
//             transaction.type2 == CategoryType.income) {
//           allDaytransactionNotifier.value.add(transaction);
//           thisYearhAlltransactionNotifier.value.add(transaction);
//           thisYearhIncometransactionNotifier.value.add(transaction);
//         } else if (transaction.transactionDate.isAfter(yearDate) &&
//             transaction.type2 == CategoryType.expense) {
//           allDaytransactionNotifier.value.add(transaction);
//           thisYearhAlltransactionNotifier.value.add(transaction);
//           thisYearhExpensetransactionNotifier.value.add(transaction);
//         }
//       },
//     );
//     allDaytransactionNotifier.notifyListeners();

//     todayAlltransactionNotifier.notifyListeners();
//     todayIncometransactionNotifier.notifyListeners();
//     todayExpensetransactionNotifier.notifyListeners();

//     thisWeekAlltransactionNotifier.notifyListeners();
//     thisWeekIncometransactionNotifier.notifyListeners();
//     thisWeekExpensetransactionNotifier.notifyListeners();

//     thisMonthAlltransactionNotifier.notifyListeners();
//     thisMonthIncometransactionNotifier.notifyListeners();
//     thisMonthExpensetransactionNotifier.notifyListeners();

//     thisYearhAlltransactionNotifier.notifyListeners();
//     thisYearhIncometransactionNotifier.notifyListeners();
//     thisYearhExpensetransactionNotifier.notifyListeners();

//     refreshUI();
//     log('print');
//     log(allDaytransactionNotifier.value.toString());
//   }
// }
