import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TripDetails extends StatelessWidget {
  const TripDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Color.fromARGB(31, 168, 166, 166),
            offset: Offset(0, 2),
            blurRadius: 10,
            spreadRadius: 1)
      ]),
      height: 100.h,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.h),
              color: Colors.black,
            ),
            padding: EdgeInsets.only(left: 10.h),
            alignment: Alignment.centerLeft,
            height: 30.h,
            width: double.infinity,
            child: Text("Trip Details",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                )),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Column(
              children: [
                //
                //Data 1
                //
                CustomRow(icon: FontAwesomeIcons.map, txt: "Trip Type"),
                SizedBox(
                  height: 5.h,
                ),
                //
                //Data 2
                //
                CustomRow(icon: FontAwesomeIcons.star, txt: "Occasion"),

                SizedBox(
                  height: 5.h,
                ),
                //
                //Data 3
                //
                CustomRow(
                    icon: FontAwesomeIcons.userGroup, txt: "Total passenger"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget CustomRow({required IconData? icon, String? txt}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          children: [
            Icon(
              icon,
              size: 15.w,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(txt!,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.black,
                )),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 8.w),
        child: Text("No data",
            style: TextStyle(
              fontSize: 10.sp,
              color: Colors.black,
            )),
      ),
    ],
  );
}
