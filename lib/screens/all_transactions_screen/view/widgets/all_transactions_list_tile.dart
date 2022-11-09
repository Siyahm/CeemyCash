import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:my_wallet/screens/add_screen/model/transaction_model.dart';
import 'package:my_wallet/screens/all_transactions_screen/controller/all_transattions_provider.dart';
import 'package:provider/provider.dart';

class AllTransactionLIstTile extends StatelessWidget {
  const AllTransactionLIstTile({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // Provider.of<AllTransactionsScreenProvider>(context, listen: false)
      //     .filteredTransaction();
      // await Provider.of<AllTransactionsScreenProvider>(context, listen: false)
      //     .refreshUI();
    });
    // final value =
    //     Provider.of<AllTransactionsScreenProvider>(context);
    return Card(
      elevation: 0,
      child: ListTile(
        leading: transaction.type2 == TransactionType.incom
            ? Icon(
                Icons.arrow_circle_up_sharp,
                color: Colors.green,
                size: 50.sp,
              )
            : Icon(
                Icons.arrow_circle_down_sharp,
                color: const Color.fromARGB(255, 255, 1, 1),
                size: 50.sp,
              ),
        title: Text(
          transaction.transactionCategory.name,
          style: TextStyle(
            color: transaction.type2 == TransactionType.incom
                ? Colors.green
                : Colors.red,
            fontSize: 27.sp,
          ),
        ),
        subtitle: Text(
          transaction.description ?? 'No description',
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Rs ${transaction.transactionAmount}',
              style: TextStyle(
                color: transaction.type2 == TransactionType.incom
                    ? Colors.green
                    : Colors.red,
                fontSize: 25.sp,
              ),
            ),
            Text(
              DateFormat('d/M/y').format(transaction.transactionDate),
              style: TextStyle(
                fontSize: 17.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
