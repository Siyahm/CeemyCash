import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_wallet/screens/all_transactions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../db_functions/transactions/transaction_db.dart';
import '../../models/transactions/transaction_model.dart';

class ScreenRecentTransactions extends StatefulWidget {
  const ScreenRecentTransactions({Key? key}) : super(key: key);

  @override
  State<ScreenRecentTransactions> createState() =>
      _ScreenRecentTransactionsState();
}

class _ScreenRecentTransactionsState extends State<ScreenRecentTransactions> {
  @override
  void initState() {
    TransactionDB.instance.refreshUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
      color: const Color.fromARGB(255, 222, 222, 222),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Recent Transactions',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: const Color.fromARGB(255, 3, 63, 86),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AllTransactions(),
                    ),
                  );
                },
                child: Text(
                  'View all',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: const Color.fromARGB(255, 159, 0, 171)),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
            ],
          ),
          ValueListenableBuilder(
              valueListenable: TransactionDB().transactionListNotifier,
              builder: (BuildContext context, List<TransactionModel> newList,
                  Widget? _) {
                if (newList.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 70.h,
                        ),
                        const Text(
                          'No Transaction',
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return ListView.separated(
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: newList.length < 3 ? newList.length : 3,
                    itemBuilder: (BuildContext context, index) {
                      final transactionvalue = newList[index];
                      return Container(
                        // height: 90.h,
                        color: const Color.fromARGB(44, 242, 242, 242),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 19.r,
                            backgroundColor:
                                transactionvalue.type2 == TransactionType.incom
                                    ? Colors.green
                                    : Colors.red,
                            child:
                                transactionvalue.type2 == TransactionType.incom
                                    ? const Icon(
                                        Icons.arrow_upward,
                                        color: Colors.white,
                                      )
                                    : const Icon(
                                        Icons.arrow_downward,
                                        color: Colors.white,
                                      ),
                          ),
                          title: Text(
                            transactionvalue.transactionCategory.name,
                            style: TextStyle(
                              color: transactionvalue.type2 ==
                                      TransactionType.incom
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: 27.sp,
                            ),
                          ),
                          subtitle: Text(
                            DateFormat('yMMMMd')
                                .format(transactionvalue.transactionDate),
                            style: TextStyle(
                              fontSize: 17.sp,
                            ),
                          ),
                          trailing: Text(
                            'Rs ${transactionvalue.transactionAmount}',
                            style: TextStyle(
                              color: transactionvalue.type2 ==
                                      TransactionType.incom
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: 25.sp,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        color: const Color.fromARGB(213, 177, 177, 177),
                        thickness: 1,
                        height: 4.4.h,
                      );
                    },
                  );
                }
              }),
        ],
      ),
    );
  }
}
