import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wallet/screens/add_screen/controller/add_screen_provider.dart';
import 'package:my_wallet/screens/categories_screen/controller/categories_provider.dart';
import 'package:provider/provider.dart';

import '../model/transaction_model.dart';

class AddTransaction extends StatelessWidget {
  const AddTransaction({
    Key? key,
    required this.type,
    required this.screenType,
    this.transactionModel,
  }) : super(key: key);

  final ScreenAction type;
  final ScreenType screenType;
  final TransactionModel? transactionModel;

  @override
  Widget build(BuildContext context) {
    final addScreenProvider =
        Provider.of<AddScreenProvider>(context, listen: false);
    final categoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (type == ScreenAction.editScreen) {
        addScreenProvider.editIncomeValueAssign(type, transactionModel!);
      }

      categoriesProvider.categoriesRefresh();
    });
    return Scaffold(
      body: Container(
        // height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 3, 45, 81),
          // gradient: LinearGradient(
          //   begin: Alignment.bottomLeft,
          //   end: Alignment.topRight,
          //   colors: [
          //     Color.fromARGB(255, 0, 27, 48),
          //     Color.fromARGB(255, 17, 149, 186),
          //   ],
          // ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(),
            Text(
              addScreenProvider.screenTypeValidator(type, screenType),
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.sp,
              ),
            ),
            Form(
              key: addScreenProvider.formKey1,
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 248.w,
                        child: TextFormField(
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          controller: addScreenProvider.dateController,
                          validator: (value) {
                            return addScreenProvider
                                .dateControllValidator(value);
                          },
                          readOnly: true,
                          decoration: const InputDecoration(
                            isDense: true,
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'dd/mm/yy',
                          ),
                        ),
                      ),
                      Positioned(
                        right: 12,
                        top: 5,
                        child: GestureDetector(
                          onTap: () async {
                            await addScreenProvider.showDate(context);
                            addScreenProvider.calenderIconOnTap();
                          },
                          child: const Icon(
                            Icons.calendar_month_sharp,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 58.w,
                      ),
                      SizedBox(
                        width: 260.w,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child:
                              Consumer2<AddScreenProvider, CategoriesProvider>(
                                  builder: (BuildContext context, value,
                                      categoryValue, Widget? child) {
                            return DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                isDense: true,
                              ),
                              alignment: Alignment.centerLeft,
                              hint: const Text('Select Income Category'),
                              value: addScreenProvider.selectincomeCategory,
                              elevation: 0,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                              ),
                              // onTap: () {
                              //   addScreenProvider.categoryOnChange(
                              //       addScreenProvider.selectedCategory!);
                              // },
                              onChanged: (String? choosedCategory) {
                                value.incomeCategoryOnChange(choosedCategory);
                              },
                              items: value.categoryFieldListItems(
                                  screenType,
                                  categoryValue.incomeCatergoryModelList,
                                  categoryValue.expenseCategoryModelList),
                              // (screenType == ScreenType.incmeScreen
                              // ? Provider.of<CategoriesProvider>(context)
                              //     .incomeCatergoryModelList
                              //         : Provider.of<CategoriesProvider>(context)
                              //             .expenseCategoryModelList)
                              //     .map((e) {
                              //   return DropdownMenuItem(
                              //     value: e.id,
                              //     child: Text(e.name),
                              //     onTap: () {
                              //       addScreenProvider.categoryOnChange(e);
                              //       // selectedCategory = e;
                              //     },
                              //   );
                              // }).toList(),
                              validator: (value) {
                                return addScreenProvider
                                    .changeCategoryValidator(value);
                              },
                            );
                          }),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          addScreenProvider
                              .addNewCategoryButtonPressed(context);
                        },
                        child: const Text(
                          'Add\nCategory',
                          style: TextStyle(
                            color: Color.fromARGB(222, 255, 255, 255),
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  SizedBox(
                    width: 248.w,
                    child: TextFormField(
                      maxLines: 1,
                      controller:
                          addScreenProvider.transactionAmountEditingController,
                      textAlign: TextAlign.left,
                      decoration: const InputDecoration(
                        hintText: 'Enter Amount',
                        filled: true,
                        fillColor: Colors.white,
                        isDense: true,
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        return addScreenProvider.amountValidator(value);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    alignment: Alignment.centerLeft,
                    width: 248.w,
                    height: 40.h,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                      addScreenProvider.expenseIncomeTextvalidator(screenType),
                      style: TextStyle(
                        color: addScreenProvider.textColor(screenType),
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  //cancel and save button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          addScreenProvider.popFunction(context);
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 1, 98, 177),
                          ),
                        ),
                        onPressed: () {
                          addScreenProvider.incomeAddSaveButtonPressed(
                              context, type, screenType, transactionModel);
                        },
                        child: const Text(
                          'Save',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
