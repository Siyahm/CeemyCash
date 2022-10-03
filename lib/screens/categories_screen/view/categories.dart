import 'package:flutter/material.dart';
import 'package:my_wallet/screens/categories_screen/controller/categories_provider.dart';
import 'package:my_wallet/screens/categories_screen/view/widgets/expense_categories.dart';
import 'package:my_wallet/screens/categories_screen/view/widgets/income_categories.dart';
import 'package:provider/provider.dart';

class ScreenCategories extends StatefulWidget {
  const ScreenCategories({Key? key}) : super(key: key);

  @override
  State<ScreenCategories> createState() => _ScreenCategoriesState();
}

class _ScreenCategoriesState extends State<ScreenCategories> {
  @override
  void dispose() {
    CategoriesProvider().nameEditignController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<CategoriesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 3, 45, 81),
        automaticallyImplyLeading: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          categoriesProvider.floatButtonPressed(context);
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromARGB(255, 0, 27, 48),
                Color.fromARGB(255, 17, 149, 186),
              ],
            ),
          ),
          child: Column(
            children: [
              TabBar(
                labelColor: const Color.fromARGB(255, 255, 238, 155),
                unselectedLabelColor: const Color.fromARGB(171, 255, 255, 255),
                indicatorColor: const Color.fromARGB(255, 255, 238, 155),
                controller: categoriesProvider.tabController,
                tabs: const [
                  Tab(
                    text: 'Income',
                  ),
                  Tab(
                    text: 'Expense',
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: categoriesProvider.tabController,
                  children: const [
                    IncomeCategories(),
                    ExpenseCategories(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> addExpenseCategoryPopup(BuildContext context) async {
  //   final categoriesProvider = Provider.of<CategoriesProvider>(context);
  //   showDialog(
  //     context: context,
  //     builder: (ctx) => AlertDialog(
  //       title: const Text('Add Expense Categgory'),
  //       content: TextFormField(
  //         controller: categoriesProvider.nameEditignController,
  //         decoration: InputDecoration(
  //           hintText: 'Enter category name',
  //           enabledBorder: OutlineInputBorder(
  //             borderSide: BorderSide(width: 1.w),
  //             borderRadius: BorderRadius.circular(15.r),
  //           ),
  //           focusedBorder: OutlineInputBorder(
  //             borderSide: BorderSide(width: 1.w),
  //             borderRadius: BorderRadius.circular(15.r),
  //           ),
  //         ),
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //           },
  //           child: const Text('Cancel'),
  //         ),
  //         ValueListenableBuilder(
  //             valueListenable: nameEditignController,
  //             builder:
  //                 ((BuildContext context, TextEditingValue value, Widget? _) {
  //               return TextButton(
  //                 onPressed: nameEditignController.text.isNotEmpty
  //                     ? () {
  //                         final name = nameEditignController.text.trim();

  //                         final categoryModelObj = CategoryModel(
  //                             id: DateTime.now()
  //                                 .millisecondsSinceEpoch
  //                                 .toString(),
  //                             name: name,
  //                             type1: CategoryType.expense);
  //                         CategoryDB().addtCategory(categoryModelObj);
  //                         nameEditignController.clear();
  //                         Navigator.of(ctx).pop();
  //                       }
  //                     : null,
  //                 child: const Text('Save'),
  //               );
  //             }))
  //       ],
  //     ),
  //   );
  // }
}
