import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wallet/screens/all_transactions_screen/controller/all_transattions_provider.dart';
import 'package:my_wallet/screens/all_transactions_screen/view/widgets/all_ransaction_list_view.dart';
import 'package:provider/provider.dart';

class AllTransactions extends StatelessWidget {
  const AllTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allTransactionProvider =
        Provider.of<AllTransactionsScreenProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      allTransactionProvider.allTransactionUIRefreshFunction();
    });
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 3, 45, 81),
      ),
      child: Scaffold(
        key: allTransactionProvider.scaffoldKey,
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
                      onChanged: (value) =>
                          allTransactionProvider.searchTransaction(value),
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
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Consumer<AllTransactionsScreenProvider>(
              builder: (context, value, child) => Row(
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
                      value: value.currentCategory,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                      ),
                      elevation: 0,
                      onChanged: (String? newValue) {
                        value.transactionTypeFilterOnChange(newValue);
                      },
                      items: value.transactionTypeFilterItemList(),
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
                      value: value.currentTransaction,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                      ),
                      elevation: 0,
                      onChanged: (String? newValues) {
                        value.transactionTimeFilterOnChange(newValues);
                      },
                      items: value.transactionTimeFilterItemList(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Consumer<AllTransactionsScreenProvider>(
              builder: (context, value, child) => Expanded(
                child: value.foundData.isNotEmpty
                    ? const AllTransactionsList()
                    : const Center(
                        child: Text(
                          'No Transactions',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
