import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LongIconContainer extends StatelessWidget {
  final double txtSize;
  final bool isBlue;
  final Color backgrondColor;
  final double padding;
  final double width;

  final VoidCallback ontap;
  final String txt;
  final IconData? icon;
  const LongIconContainer(
      {super.key,
      required this.txt,
      required this.ontap,
      required this.icon,
      this.padding = 3,
      this.isBlue = false,
      this.backgrondColor = Colors.white,
      this.width = 0,
      this.txtSize = 12});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            color: backgrondColor,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.black12)),
        padding: EdgeInsets.only(left: padding),
        alignment: Alignment.center,
        height: 35.h,
        width: width,
        child: Row(
          mainAxisAlignment:
              !isBlue ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 15.w,
              color: isBlue ? Colors.white : Colors.black,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              txt,
              style: TextStyle(
                fontSize: txtSize.sp,
                color: isBlue ? Colors.white : Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SmallBoxContainer extends StatelessWidget {
  final VoidCallback ontap;

  final IconData? icon;
  const SmallBoxContainer({super.key, required this.ontap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 50.w,
        height: 35.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.black12)),
        alignment: Alignment.center,
        child: Icon(icon, size: 20.w),
      ),
    );
  }
}

class ContainerWithIconText extends StatelessWidget {
  final VoidCallback ontap;
  final String txt1;
  final String txt2;

  final IconData? icon;
  const ContainerWithIconText(
      {super.key,
      required this.ontap,
      required this.icon,
      required this.txt1,
      required this.txt2});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.h),
        height: 35.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.black12)),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 20.w),
                SizedBox(
                  width: 4.w,
                ),
                Column(
                  children: [
                    Text(
                      txt1,
                      style: TextStyle(fontSize: 10.sp),
                    ),
                    Text(
                      txt2,
                      style: TextStyle(fontSize: 11.sp),
                    ),
                  ],
                ),
              ],
            ),
            Icon(FontAwesomeIcons.caretDown, size: 20.w),
          ],
        ),
      ),
    );
  }
}

class PageContainer extends StatelessWidget {
  final VoidCallback ontap;
  final String txt;
  final bool leftIcon;

  const PageContainer(
      {super.key,
      required this.ontap,
      required this.txt,
      this.leftIcon = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 100.w,
        height: 35.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.black12)),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leftIcon) Icon(FontAwesomeIcons.arrowLeft, size: 15.w),
            if (leftIcon)
              SizedBox(
                width: 5.h,
              ),
            Text(txt),
            if (!leftIcon)
              SizedBox(
                width: 5.h,
              ),
            if (!leftIcon) Icon(FontAwesomeIcons.arrowRight, size: 15.w),
          ],
        ),
      ),
    );
  }
}
