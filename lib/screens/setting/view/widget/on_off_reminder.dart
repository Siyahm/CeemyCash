// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:my_wallet/screens/setting/controller/settings_provider.dart';
// import 'package:provider/provider.dart';

// class OnOffRemindere extends StatelessWidget {
//   const OnOffRemindere({
//     Key? key,
//     required this.text1,
//     required this.icon1,
//   }) : super(key: key);

//   final String text1;
//   final IconData icon1;

//   @override
//   Widget build(BuildContext context) {
//     final settingsProvider = Provider.of<SettingsProvider>(context);
//     return Container(
//       padding: EdgeInsets.only(
//         left: 40.w,
//       ),
//       width: double.infinity,
//       height: 50.h,
//       child: ListTile(
//         leading: Icon(
//           icon1,
//           color: Colors.white,
//           size: 28.sp,
//         ),
//         title: Text(
//           text1,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 18.sp,
//           ),
//         ),
//         trailing: Switch(
//             activeColor: Colors.white,
//             activeTrackColor: const Color.fromARGB(255, 0, 49, 123),
//             inactiveThumbColor: Colors.grey,
//             value: settingsProvider.switchOn,
//             onChanged: (newValue) {
//               settingsProvider.onTapSwitch(newValue);
//             }),
//       ),
//     );
//   }
// }
