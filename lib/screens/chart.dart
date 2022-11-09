import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wallet/db_functions/transactions/transaction_db.dart';

import 'package:my_wallet/supporting_screens/chart_page_support/all_expense_chart.dart';
import 'package:my_wallet/supporting_screens/chart_page_support/all_income_chart.dart';

import 'package:pie_chart/pie_chart.dart';

class ScreenChart extends StatefulWidget {
  const ScreenChart({Key? key}) : super(key: key);

  @override
  State<ScreenChart> createState() => _ScreenChartState();
}

class _ScreenChartState extends State<ScreenChart>
    with TickerProviderStateMixin {
  late TabController _tabController1;

  @override
  void initState() {
    _tabController1 = TabController(length: 3, vsync: this);
    TransactionDB.instance.refreshUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 3, 45, 81),
        // gradient: LinearGradient(
        //   begin: Alignment.bottomLeft,
        //   end: Alignment.topRight,
        //   colors: [
        //     Color.fromARGB(255, 0, 27, 48),
        //     Color.fromARGB(255, 17, 149, 186),
        //   ],
        // ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'Graph View',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    // padding: EdgeInsets.only(
                    //   left: 10.w,
                    //   right: 10.w,
                    // ),
                    width: double.infinity,
                    height: 700.h,
                    color: const Color.fromARGB(255, 233, 233, 233),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // width: double.infinity,
                          color: const Color.fromARGB(255, 3, 45, 81),
                          child: TabBar(
                            indicator: const BoxDecoration(
                              color: Color.fromARGB(255, 233, 233, 233),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            labelColor: const Color.fromARGB(255, 3, 45, 81),
                            unselectedLabelColor:
                                const Color.fromARGB(171, 223, 223, 223),
                            // indicatorColor:
                            //     const Color.fromARGB(255, 255, 238, 155),
                            controller: _tabController1,
                            tabs: const [
                              Tab(
                                text: 'Over view',
                              ),
                              Tab(
                                text: 'Income',
                              ),
                              Tab(
                                text: 'Expense',
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController1,
                            children: const [
                              ScreenOverviewChart(),
                              ScreenAllIncomeCart(),
                              ScreenAllExpenseChart(),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: 20.h,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: const [
                        //     // DropDownButton(),
                        //     // CustomDate(),
                        //   ],
                        // ),

                        //,
                        // const SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ScreenOverviewChart extends StatelessWidget {
  const ScreenOverviewChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, double> transactionGraph = {
      'Income': TransactionDB.instance.totalIncome.value,
      'Expense': TransactionDB.instance.totalExpense.value,
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
