import 'package:booking/widget/summery/trip_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

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
      height: 150.h,
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
            child: Text("Your Info",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                )),
          ),
          SizedBox(
            height: 15.h,
          ),
          CustomRow(icon: FontAwesomeIcons.person, txt: "Name"),
          SizedBox(
            height: 5.h,
          ),
          CustomRow(icon: FontAwesomeIcons.houseChimney, txt: "Company"),
          SizedBox(
            height: 5.h,
          ),
          CustomRow(icon: FontAwesomeIcons.envelope, txt: "Email"),
          SizedBox(
            height: 5.h,
          ),
          CustomRow(icon: FontAwesomeIcons.phone, txt: "Primary phone"),
          SizedBox(
            height: 5.h,
          ),
          CustomRow(icon: FontAwesomeIcons.phone, txt: "Secondary phone"),
          SizedBox(
            height: 5.h,
          ),
          // CustomRow(icon: FontAwesomeIcons.person, txt: "Name"),
        ],
      ),
    );
  }
}
