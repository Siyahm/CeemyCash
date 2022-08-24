// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:my_wallet/screens/categories.dart';
// import 'package:my_wallet/screens/chart.dart';
// import 'package:my_wallet/screens/settings.dart';
// import 'package:my_wallet/supporting_screens/Home_supports/home_menulist_tiles.dart';
// import 'package:share/share.dart';

// class HomeMenuList extends StatelessWidget {
//   const HomeMenuList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: const Color.fromARGB(220, 3, 72, 101),
//       child: Column(
//         children: [
//           SizedBox(
//             height: 240.h,
//             child: DrawerHeader(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image(
//                     image: const AssetImage('lib/assets/MywalletLogo1.1.png'),
//                     height: 100.h,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Divider(
//             thickness: 1,
//             color: Colors.white,
//             indent: 17.w,
//             endIndent: 20.w,
//           ),
//           HomeListTiles(
//             text: 'Categories',
//             icon: Icons.category,
//             ontap: () {
//               Navigator.pop(context);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const ScreenCategories(),
//                 ),
//               );
//             },
//           ),
//           HomeListTiles(
//             text: 'Graphic view',
//             icon: Icons.pie_chart,
//             ontap: () {
//               Navigator.pop(context);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const ScreenChart(),
//                 ),
//               );
//             },
//           ),
//           HomeListTiles(
//             text: 'Settings',
//             icon: Icons.settings,
//             ontap: () {
//               Navigator.pop(context);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const ScreenSettings(),
//                 ),
//               );
//             },
//           ),
//           HomeListTiles(
//             text: 'Share this app',
//             icon: Icons.share,
//             ontap: () {
//               Navigator.pop(context);
//               Share.share('My Wallet');
//             },
//           ),
//           HomeListTiles(
//             text: 'Rate Us',
//             icon: Icons.star,
//             ontap: () {},
//           ),
//           const Spacer(),
//           Container(
//             width: double.maxFinite,
//             alignment: Alignment.center,
//             child: Text(
//               'v1.0.0',
//               style: TextStyle(
//                 color: const Color.fromARGB(255, 255, 255, 255),
//                 fontSize: 15.sp,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 20.h,
//           ),
//         ],
//       ),
//     );
//   }
// }
