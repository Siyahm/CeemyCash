// ignore_for_file: file_names
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:my_wallet/functions/credentials.dart';
// import 'package:my_wallet/supporting_screens/Home_supports/add_button.dart';

// import 'package:my_wallet/supporting_screens/Home_supports/home_elements.dart';
// import 'package:my_wallet/supporting_screens/Home_supports/home_menu.dart';

// class ScreenHome extends StatelessWidget {
//   ScreenHome({Key? key}) : super(key: key);

//   static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);
//   final GlobalKey<ScaffoldState> _key = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.bottomCenter,
//           end: Alignment.topRight,
//           colors: [
//             Color.fromARGB(255, 0, 31, 89),
//             Color.fromARGB(255, 17, 149, 186),
//           ],
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         key: _key,
//         drawer: const HomeMenuList(),
//         body: SafeArea(
//           child: Stack(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   const Text(
//                     'Hi,',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                   Text(
//                     userEnteredName,
//                     style: const TextStyle(
//                       color: Color.fromARGB(255, 255, 248, 181),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 width: 15,
//               ),
//               const HomeElements(),

//               IconButton(
//                 onPressed: () {
//                   _key.currentState?.openDrawer();
//                 },
//                 icon: Icon(
//                   Icons.menu,
//                   color: Colors.white,
//                   size: 30.sp,
//                 ),
//               ),
//               // Container(
//               //   width: double.infinity,
//               // )
//               Positioned(
//                 bottom: 0.h,
//                 // left: 160.w,
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       width: 175.w,
//                     ),
//                     const AddButton(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
