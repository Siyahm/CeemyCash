import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wallet/screens/categories_screen/controller/categories_provider.dart';
import 'package:my_wallet/screens/categories_screen/models/category_model.dart';
import 'package:provider/provider.dart';

class IncomeCategories extends StatelessWidget {
  const IncomeCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getCategoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getCategoriesProvider.categoriesRefresh();
    });
    // List<CategoryModel> incomeCategoriesList =

    return Padding(
      padding: EdgeInsets.only(
        top: 30.h,
      ),
      child: Consumer<CategoriesProvider>(
          builder: (BuildContext context, value, Widget? child) {
        return getCategoriesProvider.incomeCatergoryModelList.isEmpty
            ? const Center(
                child: Text(
                  'No Income Categories',
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.grey,
                  ),
                ),
              )
            : GridView.builder(
                padding: EdgeInsets.only(
                  left: 10.w,
                  right: 10.w,
                  bottom: 10.h,
                  top: 10.h,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final CategoryModel categoryy =
                      value.incomeCatergoryModelList[index];
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
                          onTap: () async {
                            await value.deleteYesButtonPressed(
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
                itemCount: value.incomeCatergoryModelList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 3 / 1),
              );
      }),
    );
  }
}
