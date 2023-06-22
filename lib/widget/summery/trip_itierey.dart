import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TripItiery extends StatelessWidget {
  const TripItiery({super.key});

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
      height: 110.h,
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
            child: Text("Trip Itinerary",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                )),
          ),
          Padding(
            padding: EdgeInsets.all(6.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        alignment: Alignment.centerLeft,
                        height: 20.h,
                        color: const Color(0XFF0DAEB0),
                        child: const Text(
                          "12 june 2023",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 25.h,
                      width: 25.h,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.orange),
                      child: const Text(
                        "S1",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      children: [
                        Text(
                          "!0:30-12:30",
                          style:
                              TextStyle(color: Colors.black, fontSize: 10.sp),
                        ),
                        Text(
                          "1A:Dhaka",
                          style:
                              TextStyle(color: Colors.black, fontSize: 10.sp),
                        ),
                        Text(
                          "1B:Comilla",
                          style:
                              TextStyle(color: Colors.black, fontSize: 10.sp),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
