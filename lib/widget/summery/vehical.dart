import 'package:booking/widget/vehical/vehical_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VehicalInfo extends StatelessWidget {
  const VehicalInfo({super.key});

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
      height: 140.h,
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
            child: Text("Vehical Info",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                )),
          ),
          VehicalContainer(
              img: "asset/car3.jpg",
              title: "Lambergini",
              ontap: () {},
              passengerNumber: 6,
              icon: FontAwesomeIcons.userGroup,
              selectTxt: "Selected",
              backgroundColor: Colors.green)
        ],
      ),
    );
  }
}
