// import 'package:flutter/material.dart';
// import 'package:my_wallet/screens/home.dart';

// class MyWalletBottomNavigation extends StatefulWidget {
//   const MyWalletBottomNavigation({Key? key}) : super(key: key);

//   @override
//   State<MyWalletBottomNavigation> createState() =>
//       _MyWalletBottomNavigationState();
// }

// class _MyWalletBottomNavigationState extends State<MyWalletBottomNavigation> {
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: ScreenHome.selectedIndexNotifier,
//       builder: (BuildContext ctx, int updatedIndex, Widget? _) {
//         return BottomNavigationBar(
//           currentIndex: updatedIndex,
//           onTap: (newIndex) {
//             ScreenHome.selectedIndexNotifier.value = newIndex;
//           },
//           selectedItemColor: Colors.white,
//           unselectedItemColor: const Color.fromARGB(113, 255, 255, 255),
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: const Color.fromARGB(255, 2, 62, 94),
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home_sharp),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.pie_chart),
//               label: 'Graph',
//             )
//           ],
//         );
//       },
//     );
//   }
// }
