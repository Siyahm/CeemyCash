// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class DropDownButton extends StatefulWidget {
//   const DropDownButton({Key? key}) : super(key: key);

//   @override
//   State<DropDownButton> createState() => _DropDownButtonState();
// }

// class _DropDownButtonState extends State<DropDownButton> {
//   String dropdownValue = 'All';

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(
//         left: 2.w,
//       ),
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//           border: Border.all(),
//           borderRadius: BorderRadius.all(
//             Radius.circular(10.r),
//           )),
//       height: 50.h,
//       width: 165.w,
//       child: DropdownButtonFormField<String>(
//           isExpanded: true,
//           iconSize: 24.r,
//           decoration: const InputDecoration.collapsed(
//             hintText: '',
//             // contentPadding: EdgeInsets.all(0),
//           ),
//           value: dropdownValue,
//           // icon: Icon(
//           //   Icons.keyboard_arrow_down,
//           //   size: 25.sp,
//           // ),
//           elevation: 0,
//           borderRadius: BorderRadius.circular(10.r),
//           style: TextStyle(
//             color: Colors.blue,
//             fontSize: 17.5.sp,
//           ),
//           items: <String>[
//             'All',
//             'This Day',
//             'This Week',
//             'This Month',
//             'This Year',
//             'This Financial Year',
//             'Custom Search',
//           ].map<DropdownMenuItem<String>>((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//           onChanged: (String? newValue) {
//             setState(() {
//               dropdownValue = newValue!;
//             });
//           }),
//     );
//   }
// }
