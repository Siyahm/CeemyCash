// import 'package:flutter/material.dart';
// import 'package:my_wallet/db_functions/category/category_db.dart';
// import 'package:my_wallet/models/category/category_model.dart';

// class SelectIncomeCategory extends StatefulWidget {
//   SelectIncomeCategory({Key? key}) : super(key: key);
//   String? selectCategory;
//   CategoryModel? selectedCategory;

//   @override
//   State<SelectIncomeCategory> createState() => _SelectIncomeCategoryState();
// }

// class _SelectIncomeCategoryState extends State<SelectIncomeCategory> {
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       alignment: Alignment.center,
//       hint: const Text('Select Income Category'),
//       underline: const SizedBox.shrink(),
//       value: widget.selectCategory,
//       elevation: 0,
//       icon: const Icon(
//         Icons.arrow_drop_down,
//       ),
//       onChanged: (String? choosedCategory) {
//         setState(() {
//           widget.selectCategory = choosedCategory!;
//         });
//       },
//       items: CategoryDB.instance.incomeCategoryListener.value.map((e) {
//         return DropdownMenuItem(
//           value: e.id,
//           child: Text(e.name),
//           onTap: () {
//             widget.selectedCategory = e;
//           },
//         );
//       }).toList(),
//     );
//   }
// }
