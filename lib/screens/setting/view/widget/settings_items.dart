import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsItems extends StatelessWidget {
  const SettingsItems({
    Key? key,
    required this.text1,
    required this.icon1,
  }) : super(key: key);

  final String text1;
  final IconData icon1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 40.w,
      ),
      width: double.infinity,
      height: 50.h,
      child: ListTile(
          leading: Icon(
            icon1,
            color: const Color.fromARGB(255, 0, 48, 84),
            size: 29.sp,
          ),
          title: Text(
            text1,
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 48, 84),
              fontSize: 19.sp,
            ),
          )),
    );
  }
}
