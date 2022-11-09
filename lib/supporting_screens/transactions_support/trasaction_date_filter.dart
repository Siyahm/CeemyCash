// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class TransactionDateFilter extends StatefulWidget {
//   const TransactionDateFilter({Key? key}) : super(key: key);

//   @override
//   State<TransactionDateFilter> createState() => _TransactionDateFilterState();
// }

// class _TransactionDateFilterState extends State<TransactionDateFilter> {
//   String defaultTransaction = 'Today';
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       height: 30.h,
//       width: 130.w,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(
//           Radius.circular(15.r),
//         ),
//         color: Colors.white,
//       ),
//       child: DropdownButton<String>(
//         value: defaultTransaction,
//         icon: const Icon(
//           Icons.arrow_drop_down,
//         ),
//         elevation: 0,
//         onChanged: (String? newValue) {
//           setState(() {
//             defaultTransaction = newValue!;
//           });
//         },
//         items: <String>[
//           'Today',
//           'This Week',
//           'This Month',
//           'This Year',
//         ].map<DropdownMenuItem<String>>((String value) {
//           return DropdownMenuItem<String>(
//             value: value,
//             child: Text(value),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
