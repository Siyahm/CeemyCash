import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wallet/screens/home_screen/controller/home_screen_provider.dart';
import 'package:my_wallet/screens/home_screen/view/widgets/home_elements.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final homeScrnProvider = Provider.of<HomeScreenProvider>(
      context,
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homeScrnProvider.iniStateCall();
    });
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
        key: homeScrnProvider.key,
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
                        homeScrnProvider.userEnteredName,
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
              HomeElements(),
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
