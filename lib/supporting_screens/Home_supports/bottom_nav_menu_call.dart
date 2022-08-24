// import 'package:flutter/material.dart';

// import 'package:my_wallet/screens/chart.dart';
// import 'package:my_wallet/screens/home.dart';
// import 'package:my_wallet/supporting_screens/Home_supports/bottom_navigation.dart';

// class NavigationCall extends StatelessWidget {
//   NavigationCall({Key? key}) : super(key: key);

//   final screensList = [
//     ScreenHome(),
//     const ScreenChart(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: const MyWalletBottomNavigation(),
//       body: SafeArea(
//         child: ValueListenableBuilder(
//           valueListenable: ScreenHome.selectedIndexNotifier,
//           builder: (BuildContext context, int updatedIndex, _) {
//             return screensList[updatedIndex];
//           },
//         ),
//       ),
//     );
//   }
// }
