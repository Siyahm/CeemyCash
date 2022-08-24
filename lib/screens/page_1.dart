import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wallet/screens/page_2.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromARGB(255, 0, 27, 48),
              Color.fromARGB(255, 17, 149, 186),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 220.h,
                child: const Image(
                  image: AssetImage(
                    'lib/assets/moneymanagement1.png',
                  ),
                ),
              ),
              SizedBox(
                height: 70.h,
              ),
              const Text(
                'Track Your Expense',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 25),
              ),
              SizedBox(
                height: 100.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    radius: 4.5.r,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 104, 104, 104),
                    radius: 4.5.r,
                  ),
                  SizedBox(
                    width: 120.w,
                  ),
                  IconButton(
                    onPressed: (() {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx1) => const PageTwo(),
                        ),
                      );
                    }),
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
