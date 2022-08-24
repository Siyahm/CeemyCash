// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class AddIncomeDate extends StatefulWidget {
//   AddIncomeDate({Key? key}) : super(key: key);
//   DateTime date = DateTime.now();

//   @override
//   State<AddIncomeDate> createState() => _AddIncomeDateState();
// }

// class _AddIncomeDateState extends State<AddIncomeDate> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         SizedBox(
//           width: 25.w,
//         ),
//         Text(
//           '${widget.date.day}/${widget.date.month}/${widget.date.year}',
//           style: TextStyle(
//             fontSize: 18.sp,
//           ),
//         ),
//         IconButton(
//           onPressed: () async {
//             DateTime? newIncomeDate = await showDatePicker(
//               context: context,
//               initialDate: widget.date,
//               firstDate: DateTime(1990),
//               lastDate: DateTime.now(),
//             );
//             if (newIncomeDate == null) return;
//             setState(() {
//               widget.date = newIncomeDate;
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
