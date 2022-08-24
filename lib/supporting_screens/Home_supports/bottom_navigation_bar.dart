import 'package:flutter/material.dart';
import 'package:my_wallet/db_functions/category/category_db.dart';
import 'package:my_wallet/db_functions/transactions/transaction_db.dart';
import 'package:my_wallet/screens/add_expense.dart';
import 'package:my_wallet/screens/add_income.dart';
import 'package:my_wallet/screens/categories.dart';
import 'package:my_wallet/screens/chart.dart';
import 'package:my_wallet/screens/home.dart';
import 'package:my_wallet/screens/settings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    TransactionDB.instance.refreshUI();
    super.initState();
  }

  bool isVisible = true;
  int selectedPageIndex = 0;

  final pageOptions = [
    const ScreenHome(),
    const ScreenCategories(),
    const ScreenChart(),
    const ScreenSettings(),
  ];

  void onItemTaped(index) {
    setState(() {
      selectedPageIndex = index;
      if (selectedPageIndex != 0) {
        isVisible = false;
      } else {
        isVisible = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 0, 31, 89),
            Color.fromARGB(255, 17, 149, 186),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: pageOptions[selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart),
              label: 'Graph',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(251, 0, 52, 90),
          unselectedItemColor: const Color.fromARGB(83, 255, 255, 255),
          currentIndex: selectedPageIndex,
          selectedItemColor: Colors.white,
          onTap: onItemTaped,
        ),
        floatingActionButton: Visibility(
          visible: isVisible,
          child: FloatingActionButton(
            elevation: 0,
            shape: const CircleBorder(
              side: BorderSide(
                color: Colors.white,
                width: 3,
              ),
            ),
            onPressed: () {
              CategoryDB.instance.refreshUI();
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.r),
                  ),
                ),
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.only(
                      left: 18.w,
                      right: 18.w,
                      bottom: 18.h,
                      top: 18.h,
                    ),
                    height: 170.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.r),
                        topRight: Radius.circular(25.r),
                      ),
                      color: const Color.fromARGB(255, 0, 63, 114),
                    ),
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => AddIncome(
                                  type: ScreenAction.addScreen,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Add Income',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                        const Divider(
                          height: 3,
                          color: Color.fromARGB(144, 255, 255, 255),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => AddExpense(
                                  type: ScreenAction2.addScreen,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Add Expense',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            backgroundColor: const Color.fromARGB(255, 1, 81, 162),
            child: const Icon(
              Icons.add_sharp,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
