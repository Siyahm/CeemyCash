// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomDate extends StatefulWidget {
//   const CustomDate({Key? key}) : super(key: key);

//   @override
//   State<CustomDate> createState() => _CustomDateState();
// }

// class _CustomDateState extends State<CustomDate> {
//   DateTime selectedDate = DateTime.now();
//   DateTime selecteTodDate = DateTime.now();

//   // Future<void> _selectedDate() async {}
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             SizedBox(
//               width: 55.w,
//             ),
//             Text(
//               'custom Search',
//               style: TextStyle(
//                 fontSize: 15.sp,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 10.h,
//         ),
//         Row(
//           children: [
//             Text(
//               'From',
//               style: TextStyle(
//                 fontSize: 15.sp,
//               ),
//             ),
//             SizedBox(
//               width: 5.w,
//             ),
//             Container(
//               height: 36.h,
//               width: 136.w,
//               padding: EdgeInsets.only(
//                 left: 6.w,
//                 right: 6.w,
//               ),
//               decoration: BoxDecoration(
//                 border: Border.all(),
//                 borderRadius: BorderRadius.circular(20.r),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
//                     style: TextStyle(
//                       fontSize: 15.sp,
//                     ),
//                   ),
//                   IconButton(
//                     padding: const EdgeInsets.all(0),
//                     onPressed: () async {
//                       DateTime? newDate = await showDatePicker(
//                         context: context,
//                         initialDate: selectedDate,
//                         firstDate: DateTime(1900),
//                         lastDate: DateTime(2023),
//                       );
//                       if (newDate == null) return;

//                       setState(() {
//                         selectedDate = newDate;
//                       });
//                     },
//                     icon: Icon(
//                       Icons.calendar_month_outlined,
//                       size: 26.sp,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 5.h,
//         ),
//         Row(
//           children: [
//             Text(
//               'To',
//               style: TextStyle(
//                 fontSize: 15.sp,
//               ),
//             ),
//             SizedBox(
//               width: 22.w,
//             ),
//             Container(
//               height: 36.h,
//               width: 136.w,
//               padding: EdgeInsets.only(
//                 left: 6.w,
//                 right: 6.w,
//               ),
//               decoration: BoxDecoration(
//                 border: Border.all(),
//                 borderRadius: BorderRadius.circular(20.r),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     '${selecteTodDate.day}/${selecteTodDate.month}/${selecteTodDate.year}',
//                     style: TextStyle(
//                       fontSize: 15.sp,
//                     ),
//                   ),
//                   IconButton(
//                     padding: const EdgeInsets.all(0),
//                     onPressed: () async {
//                       DateTime? newDate = await showDatePicker(
//                         context: context,
//                         initialDate: selecteTodDate,
//                         firstDate: DateTime(1900),
//                         lastDate: DateTime(2100),
//                       );
//                       if (newDate == null) return;

//                       setState(() {
//                         selecteTodDate = newDate;
//                       });
//                     },
//                     icon: Icon(
//                       Icons.calendar_month_outlined,
//                       size: 25.sp,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
