// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class TransactionTypeFilter extends StatefulWidget {
//   const TransactionTypeFilter({Key? key}) : super(key: key);

//   @override
//   State<TransactionTypeFilter> createState() => _TransactionTypeFilterState();
// }

// class _TransactionTypeFilterState extends State<TransactionTypeFilter> {
//   String defaultTransaction = 'All';
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
//           'All',
//           'Income',
//           'Expense',
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
