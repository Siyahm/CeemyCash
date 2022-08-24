import 'package:flutter/material.dart';

import 'package:my_wallet/screens/page_1.dart';
import 'package:my_wallet/supporting_screens/Home_supports/bottom_navigation_bar.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SaveName {
  static Future login({required String usrname}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('usrnameKey', usrname);
  }

  static Future checkSaved(BuildContext context) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final userName = sharedPreferences.getString('usrnameKey');

    if (userName == null) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const PageOne(),
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const BottomNavBar(),
        ),
      );
    }
  }
}
