import 'package:flutter/material.dart';
import 'package:my_wallet/db_functions/category/category_db.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wallet/screens/categories_screen/models/category_model.dart';
import 'package:my_wallet/supporting_screens/categories_support/expense_categories.dart';
import 'package:my_wallet/supporting_screens/categories_support/income_categories.dart';

class ScreenCategories extends StatefulWidget {
  const ScreenCategories({Key? key}) : super(key: key);

  @override
  State<ScreenCategories> createState() => _ScreenCategoriesState();
}

class _ScreenCategoriesState extends State<ScreenCategories>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ValueNotifier<int> selectedNotifier = ValueNotifier(0);
  final nameEditignController = TextEditingController();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    CategoryDB().refreshUI();
    super.initState();
  }

  @override
  void dispose() {
    nameEditignController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          _tabController.index == 0
              ? addIncomeCategoryPopup(context)
              : addExpenseCategoryPopup(context);
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
                controller: _tabController,
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
                  controller: _tabController,
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

  Future<void> addIncomeCategoryPopup(BuildContext context) async {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Add Income Categgory'),
        content: TextFormField(
          controller: nameEditignController,
          decoration: InputDecoration(
            hintText: 'Enter category name',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.w),
              borderRadius: BorderRadius.circular(15.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.w),
              borderRadius: BorderRadius.circular(15.r),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          ValueListenableBuilder(
              valueListenable: nameEditignController,
              builder:
                  ((BuildContext context, TextEditingValue value, Widget? _) {
                return TextButton(
                  onPressed: nameEditignController.text.isNotEmpty
                      ? () {
                          final name = nameEditignController.text.trim();

                          final categoryModelObj = CategoryModel(
                              id: DateTime.now()
                                  .millisecondsSinceEpoch
                                  .toString(),
                              name: name,
                              type1: CategoryType.income);
                          CategoryDB().insertCategory(categoryModelObj);
                          nameEditignController.clear();
                          Navigator.of(ctx).pop();
                        }
                      : null,
                  child: const Text('Save'),
                );
              }))
        ],
      ),
    );
  }

  Future<void> addExpenseCategoryPopup(BuildContext context) async {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Add Expense Categgory'),
        content: TextFormField(
          controller: nameEditignController,
          decoration: InputDecoration(
            hintText: 'Enter category name',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.w),
              borderRadius: BorderRadius.circular(15.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.w),
              borderRadius: BorderRadius.circular(15.r),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          ValueListenableBuilder(
              valueListenable: nameEditignController,
              builder:
                  ((BuildContext context, TextEditingValue value, Widget? _) {
                return TextButton(
                  onPressed: nameEditignController.text.isNotEmpty
                      ? () {
                          final name = nameEditignController.text.trim();

                          final categoryModelObj = CategoryModel(
                              id: DateTime.now()
                                  .millisecondsSinceEpoch
                                  .toString(),
                              name: name,
                              type1: CategoryType.expense);
                          CategoryDB().insertCategory(categoryModelObj);
                          nameEditignController.clear();
                          Navigator.of(ctx).pop();
                        }
                      : null,
                  child: const Text('Save'),
                );
              }))
        ],
      ),
    );
  }
}
