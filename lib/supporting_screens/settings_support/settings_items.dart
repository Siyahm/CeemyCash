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
            color: Colors.white,
            size: 28.sp,
          ),
          title: Text(
            text1,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
            ),
          )),
    );
  }
}

class Divider1 extends StatelessWidget {
  const Divider1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1.2,
      color: Colors.blue,
      height: 1,
    );
  }
}

class OnOffReminder extends StatefulWidget {
  const OnOffReminder({
    Key? key,
    required this.text1,
    required this.icon1,
  }) : super(key: key);

  final String text1;
  final IconData icon1;

  @override
  State<OnOffReminder> createState() => _OnOffReminderState();
}

class _OnOffReminderState extends State<OnOffReminder> {
  bool switchOn = true;
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
          widget.icon1,
          color: Colors.white,
          size: 28.sp,
        ),
        title: Text(
          widget.text1,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
          ),
        ),
        trailing: Switch(
            activeColor: Colors.white,
            activeTrackColor: const Color.fromARGB(255, 0, 49, 123),
            inactiveThumbColor: Colors.grey,
            value: switchOn,
            onChanged: (newValue) {
              setState(() {
                switchOn = newValue;
              });
            }),
      ),
    );
  }
}
