import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wallet/screens/page_1_screen/controller/page_1_provider.dart';
import 'package:provider/provider.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 1, 37, 69),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 220.h,
                child: const Image(
                  image: AssetImage(
                    'lib/assets/2-removebg-preview.png',
                  ),
                ),
              ),
              SizedBox(
                height: 80.h,
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
                      Provider.of<Page1Provider>(context, listen: false)
                          .buttonPressed(context);
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
