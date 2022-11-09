import 'package:flutter/material.dart';
import 'package:my_wallet/screens/categories_screen/view/categories.dart';
import 'package:my_wallet/screens/chart/view/chart.dart';
import 'package:my_wallet/screens/home_screen/view/home.dart';
import 'package:my_wallet/screens/setting/view/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenProvider with ChangeNotifier {
  bool isVisible = true;
  int selectedPageIndex = 0;

  final pageOptions = [
    const ScreenHome(),
    const ScreenCategories(),
    const ScreenChart(),
    const ScreenSettings(),
  ];

  void onItemTaped(index) {
    selectedPageIndex = index;
    if (selectedPageIndex != 0) {
      isVisible = false;
    } else {
      isVisible = true;
    }
    notifyListeners();
  }

  bool willPopOnTap() {
    if (selectedPageIndex != 0) {
      selectedPageIndex = 0;
      isVisible = true;

      return false;
    }
    return true;
  }

  void iniStateCall() {
    savedName();
    notifyListeners();
  }

  final GlobalKey<ScaffoldState> key = GlobalKey();

  String userEnteredName = '';

  Future<void> savedName() async {
    final name = await SharedPreferences.getInstance();
    final nameOfUser = name.getString('usrnameKey');
    userEnteredName = nameOfUser.toString();
    notifyListeners();
  }

  // Future<void> refreshWidgetUI() async {
  //   await TransactionDB.instance.refreshUI();
  //   notifyListeners();
  // }

  // void homeUIRefresh() {
  //   TransactionDB.instance.refreshUI();
  // }
}
