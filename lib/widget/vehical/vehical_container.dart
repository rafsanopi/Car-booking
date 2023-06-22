import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VehicalContainer extends StatelessWidget {
  final String img;
  final String title;
  final String selectTxt;
  final Color backgroundColor;
  final VoidCallback ontap;
  final int passengerNumber;
  final IconData icon;
  const VehicalContainer({
    super.key,
    required this.img,
    required this.title,
    required this.ontap,
    required this.passengerNumber,
    required this.icon,
    required this.selectTxt,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 6.h),
      height: 100.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 1),
        borderRadius: BorderRadius.circular(10.h),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 100.h,
            width: 120.h,
            child: Image.asset(img),
          ),
          SizedBox(
            width: 5.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                  Container(
                    height: 25.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(FontAwesomeIcons.person),
                        Text(
                          "$passengerNumber Person",
                        )
                      ],
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: ontap,
                child: Container(
                  height: 30.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.h),
                      color: backgroundColor,
                      border: Border.all(color: Colors.black12, width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        icon,
                        color: Colors.white,
                      ),
                      Text(
                        selectTxt,
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
