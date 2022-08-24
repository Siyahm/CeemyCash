// import 'package:flutter/material.dart';
// import 'package:my_wallet/screens/add_expense.dart';
// import 'package:my_wallet/screens/home.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class SaveCancelExpenseButtons extends StatelessWidget {
//   const SaveCancelExpenseButtons({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           child: Text(
//             'Cancel',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 15.sp,
//             ),
//           ),
//         ),
//         ElevatedButton(
//           style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all(
//               const Color.fromARGB(255, 1, 98, 177),
//             ),
//           ),
//           onPressed: () {
//             showDialog(
//               context: context,
//               builder: (context) => AlertDialog(
//                 title: Icon(
//                   Icons.check_circle_outline_sharp,
//                   color: Colors.green,
//                   size: 50.sp,
//                 ),
//                 content: Text(
//                   'Expense has been\nadded successfully',
//                   style: TextStyle(
//                     color: Colors.green,
//                     fontSize: 20.sp,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 actions: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       TextButton(
//                         onPressed: () => Navigator.of(context).pushReplacement(
//                           MaterialPageRoute(
//                             builder: (context) => const AddExpense(),
//                           ),
//                         ),
//                         child: const Text('Add more'),
//                       ),
//                       TextButton(
//                         onPressed: () =>
//                             Navigator.of(context).pushAndRemoveUntil(
//                                 MaterialPageRoute(
//                                   builder: (context) => ScreenHome(),
//                                 ),
//                                 (route) => false),
//                         child: const Text('Go Home'),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           },
//           child: const Text(
//             'Save',
//           ),
//         ),
//       ],
//     );
//   }
// }
