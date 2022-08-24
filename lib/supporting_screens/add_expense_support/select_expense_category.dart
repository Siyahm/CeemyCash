// import 'package:flutter/material.dart';
// import 'package:my_wallet/db_functions/category/category_db.dart';

// class SelectExpenseCategory extends StatefulWidget {
//   const SelectExpenseCategory({Key? key}) : super(key: key);

//   @override
//   State<SelectExpenseCategory> createState() => _SelectExpenseCategoryState();
// }

// class _SelectExpenseCategoryState extends State<SelectExpenseCategory> {
//   String? selectExpenseCategory;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       alignment: Alignment.center,
//       hint: const Text('Select Expense Category'),
//       underline: const SizedBox.shrink(),
//       value: selectExpenseCategory,
//       elevation: 0,
//       icon: const Icon(
//         Icons.arrow_drop_down,
//       ),
//       onChanged: (String? choosedExpnseCategory) {
//         setState(() {
//           selectExpenseCategory = choosedExpnseCategory!;
//         });
//       },
//       items: CategoryDB.instance.expenseCategoryListener.value.map((e) {
//         return DropdownMenuItem(
//           value: e.id,
//           child: Text(
//             e.name,
//             textAlign: TextAlign.center,
//           ),
//         );
//       }).toList(),
//     );
//   }
// }
