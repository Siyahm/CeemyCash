import 'package:flutter/material.dart';
import 'package:my_wallet/db_functions/transactions/transaction_db.dart';
import 'package:my_wallet/supporting_screens/Home_supports/home_cards.dart';
import 'package:my_wallet/supporting_screens/Home_supports/recent_transactions.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeElements extends StatefulWidget {
  const HomeElements({Key? key}) : super(key: key);

  @override
  State<HomeElements> createState() => _HomeElementsState();
}

class _HomeElementsState extends State<HomeElements> {
  @override
  void initState() {
    TransactionDB.instance.refreshUI();

    super.initState();
  }

  Map<String, double> transactionGraph = {
    'Income': TransactionDB.instance.totalIncome.value,
    'Expense': TransactionDB.instance.totalExpense.value,
  };
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 35.h,
          ),
          CircleAvatar(
              radius: 116.r,
              // backgroundColor: const Color.fromARGB(255, 6, 41, 77),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  PieChart(
                    colorList: const [
                      Color.fromARGB(251, 0, 52, 90),
                      // Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(249, 45, 108, 153),
                    ],
                    emptyColor: const Color.fromARGB(249, 45, 108, 153),
                    baseChartColor: const Color.fromARGB(249, 45, 108, 153),
                    legendOptions: const LegendOptions(
                      showLegends: false,
                    ),
                    chartType: ChartType.ring,
                    dataMap: transactionGraph,
                  ),
                  CircleAvatar(
                    radius: 111.r,
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Color.fromARGB(255, 9, 49, 92),
                            Color.fromARGB(255, 17, 149, 186),
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 35.h,
                          ),
                          Text(
                            'Balance\n₹',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 26.sp,
                            ),
                          ),
                          ValueListenableBuilder(
                            valueListenable: TransactionDB().currentBalance,
                            builder: (BuildContext context, value, Widget? _) {
                              return Text(
                                TransactionDB()
                                    .currentBalance
                                    .value
                                    .round()
                                    .toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 253, 243, 155),
                                    fontSize: 35.sp,
                                    fontWeight: FontWeight.bold),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: 20.h,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              color: const Color.fromARGB(255, 1, 48, 87),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                ),
                Text(
                  'Overview',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: double.infinity,
                  height: 480.h,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 222, 222, 222),
                  ),
                  child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      const HomeCards(),
                      const ScreenRecentTransactions(),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 10.h,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 0, 31, 89),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
