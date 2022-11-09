import 'package:flutter/cupertino.dart';
import 'package:my_wallet/db_functions/transactions/transaction_db.dart';
import 'package:my_wallet/screens/add_screen/model/transaction_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ScreenOverviewChart extends StatelessWidget {
  const ScreenOverviewChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      legend: Legend(isVisible: true),
      series: <CircularSeries>[
        PieSeries<TransactionModel, String>(
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          dataSource: TransactionDB.instance.transactionListNotifier.value,
          xValueMapper: (TransactionModel data, _) =>
              data.transactionCategory.name,
          yValueMapper: (TransactionModel data, _) => data.transactionAmount,
          explode: true,
          legendIconType: LegendIconType.diamond,
        ),
      ],
    );
  }
}
