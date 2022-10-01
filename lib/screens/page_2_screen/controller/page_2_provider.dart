import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_wallet/screens/welcome_screen/view/welcome.dart';

class Page2Provider with ChangeNotifier {
  void buttonPressed(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx1) => const ScreenWelcome(),
      ),
    );
  }
}
