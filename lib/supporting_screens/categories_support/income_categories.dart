import 'package:flutter/material.dart';
import 'package:my_wallet/db_functions/category/category_db.dart';
import 'package:my_wallet/models/category/category_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncomeCategories extends StatelessWidget {
  const IncomeCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CategoryDB().incomeCategoryListener,
      builder: (BuildContext context, List<CategoryModel> newList, Widget? _) {
        if (newList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'No Income Categories',
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.only(
              top: 30.h,
            ),
            child: GridView.builder(
              padding: EdgeInsets.only(
                left: 10.w,
                right: 10.w,
                bottom: 10.h,
                top: 10.h,
              ),
              itemBuilder: (BuildContext context, int index) {
                final categoryy = newList[index];
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
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                    'Do you want to delete the category ?'),
                                content: const Text(
                                    'Your category will be deleted permenently'),
                                actions: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          CategoryDB.instance
                                              .deleteCategory(categoryy.id);
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Category deleted successfully',
                                                textAlign: TextAlign.center,
                                              ),
                                              backgroundColor: Colors.green,
                                            ),
                                          );
                                        },
                                        child: const Text('Yes, Delete'),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                          );
                        },
                        child: const Icon(
                          Icons.delete_sharp,
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: newList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3 / 1),
            ),
          );
        }
      },
    );
  }
}
