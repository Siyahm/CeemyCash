import 'package:hive/hive.dart';
import 'package:my_wallet/db_functions/transactions/transaction_db.dart';

import '../../screens/categories_screen/models/category_model.dart';
part 'transaction_model.g.dart';

@HiveType(typeId: 4)
enum TransactionType {
  @HiveField(0)
  incom,

  @HiveField(1)
  exppense,
}

@HiveType(typeId: 3)
class TransactionModel extends HiveObject {
  @HiveField(0)
  DateTime transactionDate;

  @HiveField(1)
  double transactionAmount;

  @HiveField(2)
  CategoryModel transactionCategory;

  @HiveField(3)
  String? id;

  @HiveField(4)
  TransactionType type2;

  TransactionModel({
    required this.transactionDate,
    required this.transactionAmount,
    required this.transactionCategory,
    required this.type2,
  }) {
    id = DateTime.now().millisecondsSinceEpoch.toString();
  }

  Future<void> deleteTransaction(TransactionModel transaction) async {
    await transaction
        .delete()
        .whenComplete(() => TransactionDB.instance.refreshUI());
  }

  void editTransaction(TransactionModel transaction) {
    id = transaction.id;
    transactionDate = transaction.transactionDate;
    transactionAmount = transaction.transactionAmount;
    transactionCategory = transaction.transactionCategory;
    type2 = transaction.type2;
    save().whenComplete(() => TransactionDB.instance.refreshUI());
  }
}
