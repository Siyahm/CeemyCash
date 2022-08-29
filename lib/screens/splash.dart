import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_wallet/functions/credentials.dart';

import 'package:my_wallet/screens/page_1.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    startingPages(context);

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
            Color.fromARGB(255, 0, 27, 48),
            Color.fromARGB(255, 17, 149, 186),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/coin-spin3.gif',
                height: 180.h,
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

Future<void> startingPages(context) async {
  await Future.delayed(
    const Duration(seconds: 4),
  );
  SaveName.checkSaved(context);
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      // builder: (ctx) => const PageOne(),
      builder: (ctx) => const PageOne(),
    ),
  );
}
