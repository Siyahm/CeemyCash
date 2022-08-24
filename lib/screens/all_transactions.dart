import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:my_wallet/db_functions/category/category_db.dart';
import 'package:my_wallet/db_functions/transactions/transaction_db.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wallet/screens/add_expense.dart';
import 'package:my_wallet/screens/add_income.dart';
import '../models/transactions/transaction_model.dart';

class AllTransactions extends StatefulWidget {
  const AllTransactions({Key? key}) : super(key: key);

  @override
  State<AllTransactions> createState() => _AllTransactionsState();
}

class _AllTransactionsState extends State<AllTransactions> {
  final List<TransactionModel> allData =
      TransactionDB.instance.transactionListNotifier.value;
  List<TransactionModel> foundData = [];
  String searchCloseIcon = '';

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    TransactionDB.instance.refreshUI();
    TransactionDB.instance.sortedTransactions();

    foundData = allData;

    super.initState();
  }

  @override
  void didChangeDependencies() {
    //dependOnInheritedWidgetOfExactType();
    super.didChangeDependencies();
  }

  String currentCategory = 'All';
  String currentTransaction = 'All';
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Transactions'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 15.w,
                right: 15.w,
              ),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 38.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.r),
                  ),
                  color: Colors.white,
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 5.w,
                      left: 5.w,
                    ),
                    child: TextField(
                      onChanged: (value) => searchTransaction(value),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 9,
                          right: 9,
                          top: 9,
                          bottom: 9,
                        ),
                        filled: true,
                        hintText: 'Search Transaction',
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(48, 0, 0, 0),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        // suffixIcon: Visibility(
                        //   child: GestureDetector(
                        //     child: const Icon(
                        //       Icons.close,
                        //     ),
                        //   ),
                        // ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 30.h,
                  width: 130.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.r),
                    ),
                    color: Colors.white,
                  ),
                  child: DropdownButton<String>(
                    value: currentCategory,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                    ),
                    elevation: 0,
                    onChanged: (String? newValue) {
                      setState(() {
                        currentCategory = newValue!;
                      });
                      filteredTransaction();
                    },
                    items: <String>[
                      'All',
                      'Income',
                      'Expense',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(),
                Container(
                  alignment: Alignment.center,
                  height: 30.h,
                  width: 130.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.r),
                    ),
                    color: Colors.white,
                  ),
                  child: DropdownButton<String>(
                    value: currentTransaction,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                    ),
                    elevation: 0,
                    onChanged: (String? newValue) {
                      setState(() {
                        currentTransaction = newValue!;
                      });
                      filteredTransaction();
                    },
                    items: <String>[
                      'All',
                      'Today',
                      'This Week',
                      'This Month',
                      'This Year',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: foundData.isNotEmpty
                  ? ListView.separated(
                      padding: EdgeInsets.only(
                        left: 10.w,
                        right: 10.w,
                        bottom: 10.w,
                        top: 10.w,
                      ),
                      itemBuilder: (ctx, index) {
                        return Slidable(
                          startActionPane: ActionPane(
                            extentRatio: 1,
                            motion: const DrawerMotion(),
                            dismissible: DismissiblePane(onDismissed: () {}),
                            children: [
                              SlidableAction(
                                onPressed: (context) async {
                                  showDialog(
                                    context: (context),
                                    builder: (ctx) => AlertDialog(
                                      title: const Text(
                                        'Your transaction will be deleted',
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      content: const Text(
                                        'Do you want to continue ?',
                                        textAlign: TextAlign.center,
                                      ),
                                      actions: [
                                        Row(
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(_scaffoldKey
                                                    .currentContext!);
                                              },
                                              child: const Text('Cancel'),
                                            ),
                                            const Spacer(),
                                            TextButton(
                                              onPressed: () async {
                                                foundData[index].delete();
                                                filteredTransaction();
                                                await TransactionDB.instance
                                                    .refreshUI();
                                                TransactionDB.instance
                                                    .refreshUI();
                                                if (!mounted) {}
                                                ScaffoldMessenger.of(
                                                        _scaffoldKey
                                                            .currentContext!)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                      'Transaction deleted Successfully',
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 32, 106, 34),
                                                  ),
                                                );
                                                if (!mounted) {}
                                                Navigator.pop(_scaffoldKey
                                                    .currentContext!);
                                              },
                                              child: const Text('Confirm'),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                                backgroundColor: Colors.red,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                              SlidableAction(
                                onPressed: (context) {
                                  CategoryDB.instance.refreshUI();
                                  if (foundData[index].type2 ==
                                      TransactionType.incom) {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => AddIncome(
                                          type: ScreenAction.editScreen,
                                          transactionModel: foundData[index],
                                        ),
                                      ),
                                    );
                                  } else {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => AddExpense(
                                          type: ScreenAction2.editScreen,
                                          transactionModel: foundData[index],
                                        ),
                                      ),
                                    );
                                  }
                                },
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 255, 191),
                                icon: Icons.edit,
                                label: 'Edit',
                              ),
                            ],
                          ),
                          child: Card(
                            elevation: 0,
                            child: ListTile(
                              leading: foundData[index].type2 ==
                                      TransactionType.incom
                                  ? Icon(
                                      Icons.arrow_circle_up_sharp,
                                      color: Colors.green,
                                      size: 50.sp,
                                    )
                                  : Icon(
                                      Icons.arrow_circle_down_sharp,
                                      color:
                                          const Color.fromARGB(255, 255, 1, 1),
                                      size: 50.sp,
                                    ),
                              title: Text(
                                foundData[index].transactionCategory.name,
                                style: TextStyle(
                                  color: foundData[index].type2 ==
                                          TransactionType.incom
                                      ? Colors.green
                                      : Colors.red,
                                  fontSize: 27.sp,
                                ),
                              ),
                              subtitle: Text(
                                DateFormat('yMMMMd')
                                    .format(foundData[index].transactionDate),
                                style: TextStyle(
                                  fontSize: 18.sp,
                                ),
                              ),
                              trailing: Text(
                                'Rs ${foundData[index].transactionAmount}',
                                style: TextStyle(
                                  color: foundData[index].type2 ==
                                          TransactionType.incom
                                      ? Colors.green
                                      : Colors.red,
                                  fontSize: 25.sp,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          thickness: 1,
                          height: 1,
                        );
                      },
                      itemCount: foundData.length,
                    )
                  : const Center(
                      child: Text(
                        'No Transactions',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void filteredTransaction() {
    foundData = allData;
    List<TransactionModel> result = [];
    final todayDate = DateTime.now();
    final date = DateFormat('yMMMd').format(todayDate);
    final parsedTodayDate = DateFormat('yMMMd').parse(date).toString().trim();
    final weekDate = DateTime.now().subtract(const Duration(days: 7));
    final monthDate = DateTime.now().subtract(const Duration(days: 30));
    final yearDate = DateTime.now().subtract(const Duration(days: 365));

    if (currentTransaction == 'All' && currentCategory == 'All') {
      result = allData;
    } else if (currentTransaction == 'All' && currentCategory == 'Income') {
      result = foundData
          .where((element) => element.type2 == TransactionType.incom)
          .toList();
    } else if (currentTransaction == 'All' && currentCategory == 'Expense') {
      result = foundData
          .where((element) => element.type2 == TransactionType.exppense)
          .toList();
    } else if (currentTransaction == 'Today' && currentCategory == 'All') {
      // print('parsed date$parsedTodayDate ');

      result = foundData.where((element) {
        // print('Hello${element.transactionDate.toString().trim()}');
        return element.transactionDate.toString().trim() == parsedTodayDate;
      }).toList();
    } else if (currentTransaction == 'Today' && currentCategory == 'Income') {
      result = foundData
          .where((element) =>
              element.transactionDate.toString().trim() == parsedTodayDate &&
              element.type2 == TransactionType.incom)
          .toList();
    } else if (currentTransaction == 'Today' && currentCategory == 'Expense') {
      result = foundData
          .where((element) =>
              element.transactionDate.toString().trim() == parsedTodayDate &&
              element.type2 == TransactionType.exppense)
          .toList();
    } else if (currentTransaction == 'This Week' && currentCategory == 'All') {
      result = foundData
          .where(
            (element) => element.transactionDate.isAfter(weekDate),
          )
          .toList();
    } else if (currentTransaction == 'This Week' &&
        currentCategory == 'Income') {
      result = foundData
          .where((element) =>
              element.transactionDate.isAfter(weekDate) &&
              element.type2 == TransactionType.incom)
          .toList();
    } else if (currentTransaction == 'This Week' &&
        currentCategory == 'Expense') {
      result = foundData
          .where((element) =>
              element.transactionDate.isAfter(weekDate) &&
              element.type2 == TransactionType.exppense)
          .toList();
    } else if (currentTransaction == 'This Month' && currentCategory == 'All') {
      result = foundData
          .where(
            (element) => element.transactionDate.isAfter(monthDate),
          )
          .toList();
    } else if (currentTransaction == 'This Month' &&
        currentCategory == 'Income') {
      result = foundData
          .where((element) =>
              element.transactionDate.isAfter(monthDate) &&
              element.type2 == TransactionType.incom)
          .toList();
    } else if (currentTransaction == 'This Month' &&
        currentCategory == 'Expense') {
      result = foundData
          .where((element) =>
              element.transactionDate.isAfter(monthDate) &&
              element.type2 == TransactionType.exppense)
          .toList();
    } else if (currentTransaction == 'This Year' && currentCategory == 'All') {
      result = foundData
          .where(
            (element) => element.transactionDate.isAfter(yearDate),
          )
          .toList();
    } else if (currentTransaction == 'This Year' &&
        currentCategory == 'Income') {
      result = foundData
          .where((element) =>
              element.transactionDate.isAfter(yearDate) &&
              element.type2 == TransactionType.incom)
          .toList();
    } else if (currentTransaction == 'This Year' &&
        currentCategory == 'Expense') {
      result = foundData
          .where((element) =>
              element.transactionDate.isAfter(yearDate) &&
              element.type2 == TransactionType.exppense)
          .toList();
    }

    setState(() {
      foundData = result;
    });
  }

  void searchTransaction(String enteredKeyword) {
    List<TransactionModel> searchedData = [];

    if (enteredKeyword.isEmpty) {
      searchedData = allData;
    } else {
      searchedData = allData
          .where((element) => element.transactionCategory.name
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundData = searchedData;
      enteredKeyword = searchCloseIcon;
    });
  }
}
