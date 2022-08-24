// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url =
    Uri.parse('https://www.linkedin.com/in/siyaudheen-m-581b46199');
final Uri _url2 = Uri.parse('mailto:m.siyaudheen@gmail.com');

class ScreenAboutUs extends StatelessWidget {
  const ScreenAboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: SizedBox(
            height: double.infinity,
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 15.w, right: 15.w, bottom: 15.h, top: 15.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          'About App',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.sp,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'CeemyCash is a money manager application developed by SM Creations.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 150.h,
                        ),
                        Text(
                          'Connect with Developer',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.sp,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _launchUrl();
                              },
                              child: const SizedBox(
                                width: 40,
                                height: 40,
                                child: Image(
                                  image: AssetImage(
                                      'lib/assets/LinkedIn_logo_initials.png'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                _launchUrlMail();
                              },
                              child: const SizedBox(
                                width: 40,
                                height: 40,
                                child: Image(
                                  image: AssetImage(
                                      'lib/assets/831b690580156421a3b075e8387f9799.jpeg'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void _launchUrl() async {
  //   try {
  //     await launchUrl(_url);
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  Future<void> _launchUrlMail() async {
    if (!await launchUrl(_url2)) {
      throw 'Could not launch $_url';
    }
  }
}
