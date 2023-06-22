import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../const/colors.dart';
import '../controller.dart/itinerary/sagment_controller.dart';
import '../widget/itinerary/custom_containers.dart';
import '../widget/itinerary/sagment.dart';

class ItineraryScreen extends StatelessWidget {
  const ItineraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var sagmentController = Get.put(SegmentController());

    return Obx(() {
      return Column(
        children: [
          Container(
            height: sagmentController.containerHeight.value,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.h),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      spreadRadius: 1)
                ]),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.h),
                    color: Colors.black,
                  ),
                  padding: EdgeInsets.only(left: 10.h),
                  alignment: Alignment.centerLeft,
                  height: 40.h,
                  width: double.infinity,
                  child: Text("Itinerary",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                      )),
                ),
                Obx(() {
                  return SizedBox(
                    height: sagmentController.listViewHeight.value,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: sagmentController.sagmentList.length,
                      itemBuilder: (context, index) {
                        final segmentIndex = index +
                            1; // Add 1 to display the index starting from 1

                        sagmentController.sagmentIndex.value = segmentIndex;
                        return Sagments(
                          sagmentIndex: segmentIndex,
                        );
                      },
                    ),
                  );
                }),
                SizedBox(
                  height: 10.h,
                ),
                GetBuilder<SegmentController>(builder: (controller) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Row(
                      children: [
                        LongIconContainer(
                            isBlue: true,
                            backgrondColor: blue,
                            width: 120.w,
                            txt: "Add Sagment",
                            ontap: () {
                              controller.addSagment();
                              controller.multiplyNewheight();
                            },
                            icon: FontAwesomeIcons.plus),
                        SizedBox(
                          width: 5.w,
                        ),
                        LongIconContainer(
                            isBlue: true,
                            backgrondColor: blue,
                            width: 150.w,
                            txt: "Add Reverse Route",
                            ontap: () {},
                            icon: FontAwesomeIcons.rotate)
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      );
    });
  }
}
