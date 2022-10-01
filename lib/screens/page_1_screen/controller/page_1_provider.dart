import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_wallet/screens/page_2_screen/view/page_2.dart';

class Page1Provider with ChangeNotifier {
  void buttonPressed(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx1) => const PageTwo(),
      ),
    );
  }
}
