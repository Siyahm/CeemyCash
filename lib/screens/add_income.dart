import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:my_wallet/screens/categories_screen/models/category_model.dart';
import 'package:my_wallet/screens/categories_screen/view/categories.dart';
import 'package:my_wallet/supporting_screens/Home_supports/bottom_navigation_bar.dart';

import '../db_functions/category/category_db.dart';
import '../db_functions/transactions/transaction_db.dart';

import '../models/transactions/transaction_model.dart';

enum ScreenAction {
  addScreen,
  editScreen,
}

// ignore: must_be_immutable
class AddIncome extends StatefulWidget {
  AddIncome({
    Key? key,
    required this.type,
    this.transactionModel,
  }) : super(key: key);

  ScreenAction type;
  TransactionModel? transactionModel;

  @override
  State<AddIncome> createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
  String? amountType;
  String? dropDownValue;

  CategoryModel? categoryModel;
  final _formKey1 = GlobalKey<FormState>();

  @override
  void initState() {
    CategoryDB.instance.refreshUI();
    if (widget.type == ScreenAction.editScreen) {
      incomeAmountEditingController.text =
          widget.transactionModel!.transactionAmount.toString();
      dateController.text =
          DateFormat('yMMMMd').format(widget.transactionModel!.transactionDate);
      // date = widget.transactionModel!.transactionDate;

    }
    super.initState();
  }

  final incomeAmountEditingController = TextEditingController();

  // DateTime date = DateTime.now();
  String? selectincomeCategory;
  CategoryModel? selectedCategory;

  DateTime? _selectedDate;
  Future<void> _showDate() async {
    final DateTime? result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );
    if (result != null) {
      setState(() {
        _selectedDate = result;
      });
    }
  }

  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: double.maxFinite,
        width: double.maxFinite,
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(),
            widget.type == ScreenAction.addScreen
                ? Text(
                    'Add Income',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                    ),
                  )
                : Text(
                    'Edit Transaction',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                    ),
                  ),
            Form(
              key: _formKey1,
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 248.w,
                        child: TextFormField(
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          controller: dateController,
                          validator: (value) {
                            if (value == '') {
                              return 'Date cannot be empty';
                            }
                            return null;
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
                            await _showDate();
                            setState(
                              () {
                                if (_selectedDate != null) {
                                  dateController.text = DateFormat('yMMMMd')
                                      .format(_selectedDate!);
                                }
                              },
                            );
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
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              isDense: true,
                            ),
                            alignment: Alignment.centerLeft,
                            hint: const Text('Select Income Category'),
                            value: selectincomeCategory,
                            elevation: 0,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                            ),
                            onChanged: (String? choosedCategory) {
                              setState(() {
                                selectincomeCategory = choosedCategory!;
                              });
                            },
                            items: CategoryDB
                                .instance.incomeCategoryListener.value
                                .map((e) {
                              return DropdownMenuItem(
                                value: e.id,
                                child: Text(e.name),
                                onTap: () {
                                  selectedCategory = e;
                                },
                              );
                            }).toList(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please choose a category';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const ScreenCategories(),
                            ),
                          );
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
                      controller: incomeAmountEditingController,
                      textAlign: TextAlign.left,
                      decoration: const InputDecoration(
                        hintText: 'Enter Amount',
                        filled: true,
                        fillColor: Colors.white,
                        isDense: true,
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter amount';
                        } else {
                          return null;
                        }
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
                      'Income',
                      style: TextStyle(
                        color: Colors.green,
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
                          Navigator.of(context).pop();
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
                          if (_formKey1.currentState!.validate()) {
                            addOrEditIncomeTransaction();
                            Navigator.of(context).pop();
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Icon(
                                  Icons.check_circle_outline_sharp,
                                  color: Colors.green,
                                  size: 50.sp,
                                ),
                                content: Text(
                                  'Income has been\nadded successfully',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20.sp,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextButton(
                                        onPressed: () => Navigator.of(context)
                                            .pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) => AddIncome(
                                              type: ScreenAction.addScreen,
                                            ),
                                          ),
                                        ),
                                        child: const Text('Add more'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const BottomNavBar(),
                                                ),
                                                (route) => false),
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }
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

  void addOrEditIncomeTransaction() async {
    if (widget.type == ScreenAction.addScreen) {
      final incomeAmount = incomeAmountEditingController.text;

      if (incomeAmount.isEmpty) {
        return;
      }

      if (selectincomeCategory == null) {
        return;
      }

      final parcedAmount = double.tryParse(incomeAmount);
      if (parcedAmount == null) {
        return;
      }

      if (selectedCategory == null) {
        return;
      }

      final incomTransactionModel = TransactionModel(
        transactionDate: _selectedDate!,
        transactionAmount: parcedAmount,
        transactionCategory: selectedCategory!,
        type2: TransactionType.incom,
      );

      await TransactionDB.instance.addTransaction(incomTransactionModel);
    } else {
      final incomeAmount = incomeAmountEditingController.text;

      if (selectedCategory == null) {
        return null;
      }

      final parcedAmount = double.tryParse(incomeAmount);

      final editedIncomTransactionModel = TransactionModel(
        transactionDate: _selectedDate!,
        transactionAmount: parcedAmount!,
        transactionCategory: selectedCategory!,
        type2: TransactionType.incom,
      );
      widget.transactionModel?.editTransaction(editedIncomTransactionModel);
    }
  }
}
