import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_wallet/screens/splash_screen/controller/splash_screen_provider.dart';
import 'package:provider/provider.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SplashScreenProvider>(context, listen: false)
          .startingPages(context);
    });
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 27, 48),
        // gradient: LinearGradient(
        //   begin: Alignment.bottomCenter,
        //   end: Alignment.topRight,
        //   colors: [
        //     Color.fromARGB(255, 0, 27, 48),
        //     Color.fromARGB(255, 17, 149, 186),
        //   ],
        // ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/coin-spin3.gif',
                height: 170.h,
              ),
              AnimatedTextKit(animatedTexts: [
                ColorizeAnimatedText(
                    colors: [
                      Colors.white,
                      const Color.fromARGB(255, 0, 27, 48),
                    ],
                    'CeemyCash',
                    textStyle: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    )))
              ])
            ],
          ),
        ),
      ),
    );
  }
}
