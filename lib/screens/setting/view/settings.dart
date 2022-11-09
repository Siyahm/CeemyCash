import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wallet/screens/privacy_policy/view/privacy_policy.dart';
import 'package:my_wallet/screens/setting/controller/settings_provider.dart';
import 'package:my_wallet/screens/setting/view/widget/settings_divider.dart';
import 'package:my_wallet/screens/terms_and_conditions/view/terms_and_conditions.dart';
import 'package:my_wallet/screens/setting/view/widget/settings_items.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:store_redirect/store_redirect.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsProvider =
        Provider.of<SettingsProvider>(context, listen: false);
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
            color: Color.fromARGB(255, 233, 233, 233),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              // const Divider1(),
              GestureDetector(
                onTap: () {
                  settingsProvider.onClickAboutUs(context);
                },
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
                    color: Color.fromARGB(255, 0, 48, 84),
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
                                          settingsProvider
                                              .resetAllData(context);
                                          //TransactionDB.instance.refreshUI();
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
                              color: Color.fromARGB(255, 0, 0, 0),
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
                                          settingsProvider
                                              .resetAllTransactions();
                                          //TransactionDB.instance.refreshUI();
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
                              color: Color.fromARGB(255, 0, 0, 0),
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
}
