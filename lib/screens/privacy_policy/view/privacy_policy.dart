import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPlicy extends StatelessWidget {
  const PrivacyPlicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 3, 45, 81),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
            child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              left: 15.w,
              right: 15.w,
              bottom: 15.h,
              top: 15.h,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  'Privacy Policy',
                  style: TextStyle(
                    fontSize: 24.sp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "     We collect information about your activity in our services, which we use to do things like recommending a YouTube video you might like. The activity information we collect may include:\nTerms you search for videos you watch.\nViews and interactions with content and ads.\nVoice and audio information.\nPurchase activity.\nPeople with whom you communicate or share content.\nActivity on third-party sites and apps that use our services.\nChrome browsing history you've synced with your Google Account.If you use our services to make and receive calls or send and receive messages, we may collect call and message log information like your phone number, calling-party number, receiving-party number, forwarding numbers, sender and recipient email address, time and date of calls and messages, duration of calls, routing information, and types and volumes of calls and messages.\nYou can visit your Google Account to find and manage activity information that's saved in your account.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
