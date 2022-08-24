import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_wallet/models/category/category_model.dart';
import 'package:my_wallet/models/transactions/transaction_model.dart';
import 'package:my_wallet/screens/splash.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }

  if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
    Hive.registerAdapter(CategoryTypeAdapter());
  }

  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }

  if (!Hive.isAdapterRegistered(TransactionTypeAdapter().typeId)) {
    Hive.registerAdapter(TransactionTypeAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'My Wallet',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: const Color.fromARGB(255, 9, 0, 105),
            ),
          ),
          home: const ScreenSplash(),
        );
      },
    );
  }
}
