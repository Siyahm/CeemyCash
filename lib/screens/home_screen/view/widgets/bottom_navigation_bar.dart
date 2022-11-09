import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wallet/db_functions/category/category_db.dart';
import 'package:my_wallet/screens/add_screen/view/add_transaction.dart';
import 'package:my_wallet/screens/home_screen/controller/home_screen_provider.dart';
import 'package:provider/provider.dart';

import '../../../add_screen/controller/add_screen_provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addScreenProvider =
        Provider.of<AddScreenProvider>(context, listen: false);

    final homeScreenProvider = Provider.of<HomeScreenProvider>(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // homeScreenProvider.homeUIRefresh();
    });

    return Container(
      decoration: const BoxDecoration(
          // color: Color.fromARGB(255, 3, 45, 81),
          // gradient: LinearGradient(
          //   begin: Alignment.bottomCenter,
          //   end: Alignment.topRight,
          //   colors: [
          //     Color.fromARGB(255, 0, 31, 89),
          //     Color.fromARGB(255, 17, 149, 186),
          //   ],
          // ),
          ),
      child: WillPopScope(
        onWillPop: () async {
          homeScreenProvider.willPopOnTap();
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Consumer<HomeScreenProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return value.pageOptions[homeScreenProvider.selectedPageIndex];
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
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
            backgroundColor: const Color.fromARGB(255, 3, 45, 81),
            unselectedItemColor: const Color.fromARGB(83, 255, 255, 255),
            currentIndex: homeScreenProvider.selectedPageIndex,
            selectedItemColor: Colors.white,
            onTap: (index) {
              homeScreenProvider.onItemTaped(index);
            },
          ),
          floatingActionButton: Visibility(
            visible: homeScreenProvider.isVisible,
            child: FloatingActionButton(
              elevation: 0,
              shape: const CircleBorder(
                side: BorderSide(
                  color: Color.fromARGB(255, 222, 222, 222),
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
                        color: const Color.fromARGB(251, 0, 52, 90),
                      ),
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              addScreenProvider.clearAddScreenValues();
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const AddTransaction(
                                    type: ScreenAction.addScreen,
                                    screenType: ScreenType.incmeScreen,
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
                              addScreenProvider.clearAddScreenValues();
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const AddTransaction(
                                    type: ScreenAction.addScreen,
                                    screenType: ScreenType.expenseScreen,
                                  ),
                                  // AddExpense(
                                  //   type: ScreenAction2.addScreen,
                                  // ),
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
              backgroundColor: const Color.fromARGB(251, 0, 52, 90),
              child: const Icon(
                Icons.add_sharp,
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}
