import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wallet/screens/welcome_screen/controller/welcome_screen_provider.dart';
import 'package:provider/provider.dart';

class ScreenWelcome extends StatelessWidget {
  const ScreenWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final welcomeScrnProvider = Provider.of<WelcomeScreeenProvider>(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(35, 25, 35, 25),
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 1, 37, 69),
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
                  height: 160.h,
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
                        key: welcomeScrnProvider.formKey,
                        child: TextFormField(
                          controller: welcomeScrnProvider.usrNameCollector,
                          style: TextStyle(
                            fontSize: 24.sp,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 8),
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
                          validator: (value) =>
                              welcomeScrnProvider.validator(value),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 0, 23, 42),
                        ),
                        onPressed: () {
                          welcomeScrnProvider.startButttonPressed(context);
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
