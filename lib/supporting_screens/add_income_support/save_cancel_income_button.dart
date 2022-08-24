// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:my_wallet/db_functions/transactions/transaction_db.dart';
// import 'package:my_wallet/models/transactions/transaction_model.dart';

// import 'package:my_wallet/screens/add_income.dart';
// import 'package:my_wallet/screens/home.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:my_wallet/supporting_screens/add_income_support/add_income_date.dart';
// import 'package:my_wallet/supporting_screens/add_income_support/select_income_category.dart';
// import 'package:my_wallet/supporting_screens/categories_support/income_categories.dart';

// class SaveCancelIncomeButton extends StatelessWidget {
//   const SaveCancelIncomeButton({Key? key}) : super(key: key);

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
//                   'Income has been\nadded successfully',
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
//                             builder: (context) => AddIncome(),
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
//             saveIncomeTransaction();
//           },
//           child: const Text(
//             'Save',
//           ),
//         ),
//       ],
//     );
//   }

//   Future<void> saveIncomeTransaction() async {
//     final incomeAmount = AddIncome().incomeAmountEditingController.text;

//     if (incomeAmount.isEmpty) {
//       return;
//     }

//     if (SelectIncomeCategory().selectCategory == null) {
//       return;
//     }

//     final parcedAmount = double.tryParse(incomeAmount);
//     if (parcedAmount == null) {
//       return;
//     }

//     if (SelectIncomeCategory().selectedCategory == null) {
//       return;
//     }

//     final incomTransactionModel = TransactionModel(
//       incomeDate: AddIncomeDate().date,
//       incomeAmount: parcedAmount,
//       incomeCategory: SelectIncomeCategory().selectedCategory!,
//     );

//     await TransactionDB.instance.addTransaction(incomTransactionModel);
//   }
// }
