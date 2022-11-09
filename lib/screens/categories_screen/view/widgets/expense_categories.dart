import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wallet/screens/categories_screen/controller/categories_provider.dart';
import 'package:my_wallet/screens/categories_screen/models/category_model.dart';
import 'package:provider/provider.dart';

class ExpenseCategories extends StatelessWidget {
  const ExpenseCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getCategoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    final expenseCategoryList = getCategoriesProvider.expenseCategoryModelList;

    return expenseCategoryList.isEmpty
        ? const Center(
            child: Text(
              'No Expense Categories',
              style: TextStyle(
                fontSize: 23,
                color: Colors.grey,
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
              top: 30.h,
            ),
            child: Consumer<CategoriesProvider>(
              builder: (BuildContext context, value, Widget? _) {
                return GridView.builder(
                  padding: EdgeInsets.only(
                    left: 10.w,
                    right: 10.w,
                    bottom: 10.h,
                    top: 10.h,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final CategoryModel categoryy =
                        value.expenseCategoryModelList[index];
                    return Container(
                      padding: EdgeInsets.only(
                        left: 10.w,
                        right: 10.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            categoryy.name,
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              value.deleteYesButtonPressed(
                                  context, categoryy.id);
                            },
                            child: const Icon(
                              Icons.delete_sharp,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: value.expenseCategoryModelList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 3 / 1),
                );
              },
            ),
          );
  }
}
