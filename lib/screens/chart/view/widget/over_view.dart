import 'package:flutter/cupertino.dart';
import 'package:my_wallet/screens/all_transactions_screen/controller/all_transattions_provider.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenOverviewChart extends StatelessWidget {
  const ScreenOverviewChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data =
        Provider.of<AllTransactionsScreenProvider>(context, listen: false);
    Map<String, double> transactionGraph = {
      'Income': data.totalIncome,
      'Expense': data.totalExpense,
    };
    return PieChart(
        chartRadius: 400.sp,
        chartLegendSpacing: 25.sp,
        legendOptions: const LegendOptions(
          legendShape: BoxShape.rectangle,
          legendPosition: LegendPosition.bottom,
          showLegendsInRow: true,
        ),
        chartValuesOptions: const ChartValuesOptions(
          showChartValueBackground: false,
        ),
        colorList: const [
          Color.fromRGBO(75, 135, 185, 1),
          Color.fromRGBO(192, 108, 132, 1),
        ],
        chartType: ChartType.disc,
        dataMap: transactionGraph);
  }
}
