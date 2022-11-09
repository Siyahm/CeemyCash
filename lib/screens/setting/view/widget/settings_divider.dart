import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Divider1 extends StatelessWidget {
  const Divider1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1.2,
      color: Colors.white,
      height: 1,
    );
  }
}
