import 'package:booking/widget/summery/trip_details.dart';
import 'package:booking/widget/summery/trip_itierey.dart';
import 'package:booking/widget/summery/userinfo.dart';
import 'package:booking/widget/summery/vehical.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummeryScreen extends StatelessWidget {
  const SummeryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(6.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const TripItiery(),
            SizedBox(
              height: 5.h,
            ),
            const TripDetails(),
            SizedBox(
              height: 5.h,
            ),
            const VehicalInfo(),
            SizedBox(
              height: 5.h,
            ),
            const UserInfo()
          ],
        ));
  }
}
