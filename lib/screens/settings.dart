import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_wallet/db_functions/category/category_db.dart';
import 'package:my_wallet/db_functions/transactions/transaction_db.dart';

import 'package:my_wallet/models/category/category_model.dart';
import 'package:my_wallet/models/transactions/transaction_model.dart';
import 'package:my_wallet/screens/about.dart';
import 'package:my_wallet/screens/privacy_policy.dart';
import 'package:my_wallet/screens/splash.dart';
import 'package:my_wallet/screens/terms_and_conditions.dart';
import 'package:my_wallet/supporting_screens/settings_support/settings_items.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_redirect/store_redirect.dart';

class ScreenSettings extends StatefulWidget {
  const ScreenSettings({Key? key}) : super(key: key);

  @override
  State<ScreenSettings> createState() => _ScreenSettingsState();
}

class _ScreenSettingsState extends State<ScreenSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 48, 84),
        title: const Text('Settings'),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: Container(
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
            children: [
              SizedBox(
                height: 40.h,
              ),
              // const Divider1(),
              GestureDetector(
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScreenAboutUs(),
                    ),
                  );
                }),
                child: const SettingsItems(
                  text1: 'About Us',
                  icon1: Icons.info_outline,
                ),
              ),
              const Divider1(),

              GestureDetector(
                onTap: () {},
                child: ExpansionTile(
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  trailing: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  expandedAlignment: Alignment.center,
                  // expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  tilePadding: const EdgeInsets.only(left: 0, right: 20),
                  title: const SettingsItems(
                    text1: 'Reset Data',
                    icon1: Icons.restart_alt_rounded,
                  ),
                  children: [
                    SizedBox(
                      width: 140,
                      child: ListTile(
                        title: TextButton(
                          onPressed: () {
                            showDialog(
                              context: (context),
                              builder: (ctx) => AlertDialog(
                                title: const Text(
                                  'All Data will be deleted',
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
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      const Spacer(),
                                      TextButton(
                                        onPressed: () {
                                          resetAllData();
                                          TransactionDB.instance.refreshUI();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'All Data Deleted Successfully',
                                                textAlign: TextAlign.center,
                                              ),
                                              backgroundColor: Color.fromARGB(
                                                  255, 32, 106, 34),
                                            ),
                                          );
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Confirm'),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                          child: const Text(
                            'Delete all data',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 248, 186),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 190,
                      child: ListTile(
                        title: TextButton(
                          onPressed: () {
                            showDialog(
                              context: (context),
                              builder: (ctx) => AlertDialog(
                                title: const Text(
                                  'All Transactions will be deleted',
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
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      const Spacer(),
                                      TextButton(
                                        onPressed: () {
                                          resetAllTransactions();
                                          TransactionDB.instance.refreshUI();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'All Transactions Deleted Successfully',
                                                textAlign: TextAlign.center,
                                              ),
                                              backgroundColor: Color.fromARGB(
                                                  255, 32, 106, 34),
                                            ),
                                          );
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Confirm'),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                          child: const Text(
                            'Delete all transactions',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 248, 186),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider1(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPlicy(),
                    ),
                  );
                },
                child: const SettingsItems(
                  text1: 'Privacy Policy',
                  icon1: Icons.privacy_tip_outlined,
                ),
              ),
              const Divider1(),
              GestureDetector(
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TermsAndConditions(),
                    ),
                  );
                }),
                child: const SettingsItems(
                  text1: 'Terms and Conditions',
                  icon1: Icons.rule,
                ),
              ),
              const Divider1(),
              GestureDetector(
                onTap: (() {
                  Navigator.pop(context);
                  Share.share(
                      'https://play.google.com/store/apps/details?id=in.siyaudheen.my_wallet');
                }),
                child: const SettingsItems(
                  text1: 'Share this app',
                  icon1: Icons.share,
                ),
              ),
              const Divider1(),
              GestureDetector(
                onTap: (() {
                  StoreRedirect.redirect(
                      androidAppId: "in.siyaudheen.my_wallet");
                }),
                child: const SettingsItems(
                  text1: 'Check for Update',
                  icon1: Icons.update_sharp,
                ),
              ),
              const Divider1(),
              GestureDetector(
                onTap: (() {
                  StoreRedirect.redirect(
                      androidAppId: "in.siyaudheen.my_wallet");
                }),
                child: const SettingsItems(
                  text1: 'Rate Us',
                  icon1: Icons.star,
                ),
              ),
              const Spacer(),
              Container(
                width: double.maxFinite,
                alignment: Alignment.center,
                child: Text(
                  'v1.0.1',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 15.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              // const Divider1(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> resetAllData() async {
    final deleteCategory = await Hive.openBox<CategoryModel>(categoryDbName);
    deleteCategory.deleteFromDisk();

    final deleteAllTransactions =
        await Hive.openBox<TransactionModel>(transactionDbName);
    deleteAllTransactions.deleteFromDisk();

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    if (!mounted) {}
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const ScreenSplash(),
      ),
    );
  }

  Future<void> resetAllTransactions() async {
    final deleteAllTransactions =
        await Hive.openBox<TransactionModel>(transactionDbName);
    deleteAllTransactions.deleteFromDisk();
    await TransactionDB.instance.refreshUI();
  }
}
