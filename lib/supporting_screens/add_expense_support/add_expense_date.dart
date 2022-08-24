// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';

// class AddExpenseDate extends StatefulWidget {
//   const AddExpenseDate({Key? key}) : super(key: key);

//   @override
//   State<AddExpenseDate> createState() => _AddExpenseDateState();
// }

// class _AddExpenseDateState extends State<AddExpenseDate> {
//   DateTime expenseDate = DateTime.now();
  // var myFormat = DateFormat('d-MM-yyyy');
//   @override
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         SizedBox(
//           width: 25.w,
//         ),
//         // Text(
//         //   'd${expenseDate.day}/${expenseDate.month}/${expenseDate.year}',
//         //   style: TextStyle(
//         //     fontSize: 18.sp,
//         //   ),
//         // ),
//         IconButton(
//           onPressed: () async {
//             DateTime? newIncomeDate = await showDatePicker(
//               context: context,
//               initialDate: expenseDate,
//               firstDate: DateTime(1990),
//               lastDate: DateTime.now(),
//             );
//             if (newIncomeDate == null) return;
//             setState(() {
//               expenseDate = newIncomeDate;
//             });
//           },
//           icon: const Icon(
//             Icons.calendar_month,
//           ),
//         ),
//       ],
//     );
//   }
// }
