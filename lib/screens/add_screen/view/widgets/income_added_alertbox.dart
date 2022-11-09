import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wallet/screens/add_screen/controller/add_screen_provider.dart';
import 'package:provider/provider.dart';

class IncomeAddedAlertBox extends StatelessWidget {
  const IncomeAddedAlertBox({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Icon(
        Icons.check_circle_outline_sharp,
        color: Colors.green,
        size: 50.sp,
      ),
      content: Text(
        text,
        style: TextStyle(
          color: Colors.green,
          fontSize: 20.sp,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: onPressed,
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(
              //     builder: (context) => AddIncome(
              //       type: ScreenAction.addScreen, screenType: ,
              //     ),
              //   ),
              // ),
              child: const Text('Add more'),
            ),
            TextButton(
              onPressed: () =>
                  Provider.of<AddScreenProvider>(context, listen: false)
                      .popFunction(context),
              child: const Text('Ok'),
            ),
          ],
        ),
      ],
    );
  }
}
