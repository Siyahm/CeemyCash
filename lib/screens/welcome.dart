import 'package:flutter/material.dart';
import 'package:my_wallet/functions/credentials.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wallet/supporting_screens/Home_supports/bottom_navigation_bar.dart';

class ScreenWelcome extends StatelessWidget {
  ScreenWelcome({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  final TextEditingController usrNameCollector = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(35, 25, 35, 25),
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 0, 27, 48),
              Color.fromARGB(255, 17, 149, 186),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100.h,
                  width: 270.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/assets/welcome2.png'),
                      fit: BoxFit.fitWidth,
                      opacity: 0.8,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
                // const SizedBox(
                //   height: 155,
                // ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 20.h,
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Color.fromARGB(255, 207, 207, 207),
                          ),
                          bottom: BorderSide(
                            color: Color.fromARGB(255, 207, 207, 207),
                          ),
                        ),
                      ),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: usrNameCollector,
                          style: TextStyle(
                            fontSize: 24.sp,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                              fontSize: 18.sp,
                            ),
                            border: InputBorder.none,
                            hintText: 'Type your name',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 24.sp,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Name is required';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            SaveName.login(
                              usrname: usrNameCollector.text,
                            );
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx2) => const BottomNavBar(),
                              ),
                            );
                          }
                        },
                        child: const Text('START'),
                      ),
                    ),
                  ],
                ),
                const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
