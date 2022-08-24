import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wallet/db_functions/transactions/transaction_db.dart';

import 'package:my_wallet/supporting_screens/Home_supports/home_elements.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  String userEnteredName = '';

  Future<void> savedName() async {
    final name = await SharedPreferences.getInstance();
    final nameOfUser = name.getString('usrnameKey');
    setState(() {
      userEnteredName = nameOfUser.toString();
    });
  }

  @override
  void initState() {
    savedName();
    TransactionDB.instance.refreshUI();
    super.initState();
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
        key: _key,
        body: SafeArea(
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 30.w,
                      ),
                      const Text(
                        'Hi,',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        userEnteredName,
                        style: TextStyle(
                            fontSize: 25.sp,
                            color: const Color.fromARGB(255, 255, 248, 181),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              const HomeElements(),
              Positioned(
                bottom: 0.h,
                // left: 160.w,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 175.w,
                    ),
                    // const AddButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
