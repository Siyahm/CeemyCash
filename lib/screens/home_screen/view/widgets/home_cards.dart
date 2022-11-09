import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wallet/db_functions/transactions/transaction_db.dart';

class HomeCards extends StatelessWidget {
  const HomeCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.only(
            right: 5,
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 222, 222, 222),
                Colors.white,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                spreadRadius: 2.r,
                blurRadius: 2.r,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          height: 110.h,
          width: 204.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 3.w,
                      right: 3.w,
                    ),
                  ),
                  Icon(
                    Icons.arrow_upward,
                    color: Colors.green,
                    size: 50.sp,
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        'Income',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: ValueListenableBuilder(
                  valueListenable: TransactionDB.instance.totalIncome,
                  builder: (BuildContext context, value, Widget? _) {
                    return Text(
                      '₹ ${TransactionDB.instance.totalIncome.value.round().toString()}',
                      style: TextStyle(
                        fontSize: 27.sp,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Colors.white,
                Color.fromARGB(255, 222, 222, 222),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                spreadRadius: 2.r,
                blurRadius: 2.r,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          height: 110.h,
          width: 204.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8.w,
                      right: 3.w,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        'Expense',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_downward,
                    color: Colors.red,
                    size: 50.sp,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 13.sp,
                ),
                child: ValueListenableBuilder(
                  valueListenable: TransactionDB.instance.totalExpense,
                  builder: (BuildContext context, value, Widget? _) {
                    return Text(
                      '₹ ${TransactionDB.instance.totalExpense.value.round().toString()}',
                      style: TextStyle(
                        fontSize: 27.sp,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
