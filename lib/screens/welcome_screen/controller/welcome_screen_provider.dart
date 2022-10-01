import 'package:flutter/material.dart';
import 'package:my_wallet/screens/page_1_screen/view/page_1.dart';
import 'package:my_wallet/supporting_screens/Home_supports/bottom_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreeenProvider with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final TextEditingController usrNameCollector = TextEditingController();

  Future login({required String usrname}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('usrnameKey', usrname);
  }

  void startButttonPressed(context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      login(
        usrname: usrNameCollector.text,
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx2) => const BottomNavBar(),
        ),
      );
    }
  }

  String? validator(value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    } else {
      return null;
    }
  }
}
