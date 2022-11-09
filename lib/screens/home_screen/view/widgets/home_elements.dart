import 'package:flutter/material.dart';
import 'package:my_wallet/db_functions/transactions/transaction_db.dart';
import 'package:my_wallet/screens/all_transactions_screen/controller/all_transattions_provider.dart';
import 'package:my_wallet/screens/home_screen/controller/home_screen_provider.dart';
import 'package:my_wallet/screens/home_screen/view/widgets/home_cards.dart';
import 'package:my_wallet/screens/home_screen/view/widgets/recent_transactions.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeElements extends StatelessWidget {
  const HomeElements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeScrnProvider =
        Provider.of<AllTransactionsScreenProvider>(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homeScrnProvider.refreshUI();
    });
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 45.h,
          ),
          CircleAvatar(
            radius: 120.r,
            // backgroundColor: const Color.fromARGB(255, 6, 41, 77),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                PieChart(
                  colorList: const [
                    Color.fromARGB(251, 0, 52, 90),
                    // Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(248, 255, 255, 255),
                  ],
                  emptyColor: const Color.fromARGB(250, 1, 59, 100),
                  baseChartColor: const Color.fromARGB(250, 1, 59, 100),
                  legendOptions: const LegendOptions(
                    showLegends: false,
                  ),
                  chartType: ChartType.ring,
                  dataMap: homeScrnProvider.transactionGraph,
                ),
                CircleAvatar(
                  radius: 115.r,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(251, 0, 52, 90),
                      shape: BoxShape.circle,
                      // gradient: LinearGradient(
                      //   begin: Alignment.bottomLeft,
                      //   end: Alignment.topRight,
                      //   colors: [
                      //     Color.fromARGB(255, 9, 49, 92),
                      //     Color.fromARGB(255, 17, 149, 186),
                      //   ],
                      // ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 55.h,
                        ),
                        Text(
                          'Balance\n₹',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 27.sp,
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
                                  color:
                                      const Color.fromARGB(255, 253, 243, 155),
                                  fontSize: 37.sp,
                                  fontWeight: FontWeight.bold),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 10.h,
          // ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Text(
                //   'Overview',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 20.sp,
                //   ),
                //   textAlign: TextAlign.center,
                // ),
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
