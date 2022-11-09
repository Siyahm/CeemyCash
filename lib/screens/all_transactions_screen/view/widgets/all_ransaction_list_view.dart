import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_wallet/screens/all_transactions_screen/controller/all_transattions_provider.dart';
import 'package:my_wallet/screens/all_transactions_screen/view/widgets/all_transactions_list_tile.dart';
import 'package:provider/provider.dart';

class AllTransactionsList extends StatelessWidget {
  const AllTransactionsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allTrasactionProvider =
        Provider.of<AllTransactionsScreenProvider>(context);
    return ListView.separated(
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
                                Navigator.pop(allTrasactionProvider
                                    .scaffoldKey.currentContext!);
                              },
                              child: const Text('Cancel'),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () async {
                                allTrasactionProvider
                                    .deleteButtonPressed(index);

                                ScaffoldMessenger.of(allTrasactionProvider
                                        .scaffoldKey.currentContext!)
                                    .showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Transaction deleted Successfully',
                                      textAlign: TextAlign.center,
                                    ),
                                    backgroundColor:
                                        Color.fromARGB(255, 32, 106, 34),
                                  ),
                                );

                                Navigator.pop(allTrasactionProvider
                                    .scaffoldKey.currentContext!);
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
                  allTrasactionProvider.editButtonPressed(index, context);
                },
                backgroundColor: const Color.fromARGB(255, 255, 255, 191),
                icon: Icons.edit,
                label: 'Edit',
              ),
            ],
          ),
          child: AllTransactionLIstTile(
            allTrasactionProvider: allTrasactionProvider,
            index: index,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          thickness: 1,
          height: 1,
        );
      },
      itemCount: allTrasactionProvider.foundData.length,
    );
  }
}
