import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wallet/screens/page_2_screen/controller/page_2_provider.dart';
import 'package:provider/provider.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // const SizedBox(
              //   height: 180,
              // ),
              SizedBox(
                height: 300.h,
                child: const Image(
                  color: Colors.white,
                  image: AssetImage(
                    'lib/assets/3-removebg-preview.png',
                  ),
                ),
              ),
              SizedBox(
                height: 70.h,
              ),
              const Text(
                'Save Your Money',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              SizedBox(
                height: 100.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 122, 122, 122),
                    radius: 4.5.r,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    radius: 4.5.r,
                  ),
                  SizedBox(
                    width: 130.w,
                  ),
                  IconButton(
                    onPressed: (() {
                      Provider.of<Page2Provider>(context, listen: false)
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
