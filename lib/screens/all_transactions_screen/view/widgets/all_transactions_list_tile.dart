import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:my_wallet/screens/add_screen/model/transaction_model.dart';
import 'package:my_wallet/screens/all_transactions_screen/controller/all_transattions_provider.dart';

class AllTransactionLIstTile extends StatelessWidget {
  const AllTransactionLIstTile({
    Key? key,
    required this.allTrasactionProvider,
    required this.index,
  }) : super(key: key);

  final AllTransactionsScreenProvider allTrasactionProvider;
  final int index;

  @override
  Widget build(BuildContext context) {
    // final allTrasactionProvider =
    //     Provider.of<AllTransactionsScreenProvider>(context);
    return Card(
      elevation: 0,
      child: ListTile(
        leading: allTrasactionProvider.foundData[index].type2 ==
                TransactionType.incom
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
          allTrasactionProvider.foundData[index].transactionCategory.name,
          style: TextStyle(
            color: allTrasactionProvider.foundData[index].type2 ==
                    TransactionType.incom
                ? Colors.green
                : Colors.red,
            fontSize: 27.sp,
          ),
        ),
        subtitle: Text(
          DateFormat('yMMMMd')
              .format(allTrasactionProvider.foundData[index].transactionDate),
          style: TextStyle(
            fontSize: 18.sp,
          ),
        ),
        trailing: Text(
          'Rs ${allTrasactionProvider.foundData[index].transactionAmount}',
          style: TextStyle(
            color: allTrasactionProvider.foundData[index].type2 ==
                    TransactionType.incom
                ? Colors.green
                : Colors.red,
            fontSize: 25.sp,
          ),
        ),
      ),
    );
  }
}
