import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wallet/screens/chart/controller/char_provider.dart';
import 'package:my_wallet/screens/chart/view/widget/all_expense_chart.dart';
import 'package:my_wallet/screens/chart/view/widget/all_income_chart.dart';
import 'package:my_wallet/screens/chart/view/widget/over_view.dart';
import 'package:provider/provider.dart';

class ScreenChart extends StatelessWidget {
  const ScreenChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chartProvider = Provider.of<ChartProvider>(context, listen: false);
    chartProvider.tabController1 =
        TabController(length: 3, vsync: Scaffold.of(context));
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 3, 45, 81),
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
                            controller: chartProvider.tabController1,
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
                            controller: chartProvider.tabController1,
                            children: const [
                              ScreenOverviewChart(),
                              ScreenAllIncomeCart(),
                              ScreenAllExpenseChart(),
                            ],
                          ),
                        ),
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
