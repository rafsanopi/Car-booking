import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerIconTxtTxteditingForm extends StatelessWidget {
  final IconData icon;
  final String txt;
  const ContainerIconTxtTxteditingForm(
      {super.key, required this.icon, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.h),
        border: Border.all(color: Colors.black12, width: 1),
      ),
      child: Row(children: [
        Icon(icon),
        SizedBox(
          width: 8.w,
        ),
        Column(
          children: [
            Text(txt),
            SizedBox(
              width: 80.w,
              height: 15.h,
              child: TextFormField(
                showCursor: false,
                textAlignVertical: TextAlignVertical.bottom,
                cursorHeight: 10.sp,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 10.sp),
                    hintText: "Enter here"),
              ),
            )
          ],
        )
      ]),
    );
  }
}

class ContactButton extends StatelessWidget {
  final IconData icon;
  final String selectTxt;
  final Color backgroundColor;
  final VoidCallback ontap;
  const ContactButton(
      {super.key,
      required this.selectTxt,
      required this.backgroundColor,
      required this.ontap,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 30.h,
        width: 60.w,
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
    );
  }
}
