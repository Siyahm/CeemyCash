import 'package:flutter/cupertino.dart';
import 'package:my_wallet/db_functions/transactions/transaction_db.dart';
import 'package:my_wallet/screens/all_transactions_screen/controller/all_transattions_provider.dart';

import 'package:my_wallet/screens/chart/utils/data_for_chart.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ScreenAllExpenseChart extends StatelessWidget {
  const ScreenAllExpenseChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data =
        Provider.of<AllTransactionsScreenProvider>(context, listen: false);
    return SfCircularChart(
      legend: Legend(isVisible: true),
      series: <CircularSeries>[
        PieSeries<DataForChart, String>(
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          dataSource: mergedChart(data.expenseTransactionListNotifier),
          xValueMapper: (DataForChart data, _) => data.categoryName,
          yValueMapper: (DataForChart data, _) => data.amount,
          explode: true,
          legendIconType: LegendIconType.diamond,
        ),
      ],
    );
  }
}
