import 'package:flutter/cupertino.dart';
import 'package:my_wallet/db_functions/transactions/transaction_db.dart';

import 'package:my_wallet/supporting_screens/chart_page_support/data_for_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ScreenAllIncomeCart extends StatelessWidget {
  const ScreenAllIncomeCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      legend: Legend(isVisible: true),
      series: <CircularSeries>[
        PieSeries<DataForChart, String>(
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          dataSource: mergedChart(
              TransactionDB.instance.incomeTransactionListNotifier.value),
          xValueMapper: (DataForChart data, _) => data.categoryName,
          yValueMapper: (DataForChart data, _) => data.amount,
          explode: true,
          legendIconType: LegendIconType.diamond,
        ),
      ],
    );
  }
}
