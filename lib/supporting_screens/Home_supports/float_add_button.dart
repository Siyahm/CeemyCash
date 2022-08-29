// import 'package:flutter/material.dart';
// import 'package:my_wallet/db_functions/category/category_db.dart';
// import 'package:my_wallet/screens/add_expense.dart';
// import 'package:my_wallet/screens/add_income.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class AddButton extends StatelessWidget {
//   const AddButton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionButton(
//       elevation: 0,
//       shape: const CircleBorder(
//         side: BorderSide(
//           color: Color.fromARGB(255, 194, 194, 194),
//           width: 3,
//         ),
//       ),
//       onPressed: () {
//         CategoryDB.instance.refreshUI();
//         showModalBottomSheet(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.vertical(
//               top: Radius.circular(25.r),
//             ),
//           ),
//           context: context,
//           builder: (BuildContext context) {
//             return Container(
//               padding: EdgeInsets.only(
//                 left: 18.w,
//                 right: 18.w,
//                 bottom: 18.h,
//                 top: 18.h,
//               ),
//               height: 170.h,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(25.r),
//                   topRight: Radius.circular(25.r),
//                 ),
//                 color: const Color.fromARGB(255, 0, 63, 114),
//               ),
//               child: Column(
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pushReplacement(
//                         MaterialPageRoute(
//                           builder: (context) => AddIncome(
//                             type: ScreenAction.addScreen,
//                           ),
//                         ),
//                       );
//                     },
//                     child: Text(
//                       'Add Income',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18.sp,
//                       ),
//                     ),
//                   ),
//                   const Divider(
//                     height: 3,
//                     color: Color.fromARGB(144, 255, 255, 255),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pushReplacement(
//                         MaterialPageRoute(
//                           builder: (context) => AddExpense(
//                             type: ScreenAction2.addScreen,
//                           ),
//                         ),
//                       );
//                     },
//                     child: Text(
//                       'Add Expense',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18.sp,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//       backgroundColor: const Color.fromARGB(255, 1, 81, 162),
//       child: const Icon(
//         Icons.add_sharp,
//       ),
//     );
//   }
// }
