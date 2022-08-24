import 'package:my_wallet/models/transactions/transaction_model.dart';

class DataForChart {
  final int amount;
  final String categoryName;

  DataForChart(this.amount, this.categoryName);
}

mergedChart(List<TransactionModel> list) {
  int value;
  String categoryName1;

  List temp = [];
  List<DataForChart> returnChartData = [];

  for (var i = 0; i < list.length; i++) {
    temp.add(0);
  }

  for (var i = 0; i < list.length; i++) {
    value = list[i].transactionAmount.toInt();
    categoryName1 = list[i].transactionCategory.name;
    for (var j = i + 1; j < list.length; j++) {
      if (categoryName1 == list[j].transactionCategory.name) {
        value += list[j].transactionAmount.toInt();
        temp[j] = -1;
      }
    }
    if (temp[i] != -1) {
      returnChartData.add(
        DataForChart(value, categoryName1),
      );
    }
  }
  return returnChartData;
}
