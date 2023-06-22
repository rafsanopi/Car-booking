import 'package:booking/controller.dart/vehical/vehical_controller.dart';
import 'package:booking/widget/vehical/vehical_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class VehicalScreen extends StatelessWidget {
  const VehicalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var vehicalController = Get.put(VehicalController());
    return Padding(
      padding: EdgeInsets.all(6.h),
      child: Container(
        alignment: Alignment.center,
        height: 410.h,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 1)
        ]),
        child: GetBuilder<VehicalController>(builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                child: Text("Vehical Selection",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                    )),
              ),
              Obx(() {
                return Padding(
                  padding: EdgeInsets.all(6.h),
                  child: Column(
                    children: [
                      VehicalContainer(
                          selectTxt: vehicalController.vehicalIndex.value == 0
                              ? "Selected"
                              : "Select",
                          backgroundColor:
                              vehicalController.vehicalIndex.value == 0
                                  ? Colors.green
                                  : Colors.blue,
                          icon: vehicalController.vehicalIndex.value == 0
                              ? FontAwesomeIcons.check
                              : FontAwesomeIcons.caretRight,
                          img: "asset/car1.jpg",
                          title: "General SUV",
                          ontap: () {
                            controller.vehicalIndex.value = 0;
                          },
                          passengerNumber: 1),
                      VehicalContainer(
                          selectTxt: vehicalController.vehicalIndex.value == 1
                              ? "Selected"
                              : "Select",
                          backgroundColor:
                              vehicalController.vehicalIndex.value == 1
                                  ? Colors.green
                                  : Colors.blue,
                          icon: vehicalController.vehicalIndex.value == 1
                              ? FontAwesomeIcons.check
                              : FontAwesomeIcons.caretRight,
                          img: "asset/car2.jpg",
                          title: "General SUV",
                          ontap: () {
                            controller.vehicalIndex.value = 1;
                          },
                          passengerNumber: 2),
                      VehicalContainer(
                          selectTxt: vehicalController.vehicalIndex.value == 2
                              ? "Selected"
                              : "Select",
                          backgroundColor:
                              vehicalController.vehicalIndex.value == 2
                                  ? Colors.green
                                  : Colors.blue,
                          icon: vehicalController.vehicalIndex.value == 2
                              ? FontAwesomeIcons.check
                              : FontAwesomeIcons.caretRight,
                          img: "asset/car3.jpg",
                          title: "General SUV",
                          ontap: () {
                            controller.vehicalIndex.value = 2;
                          },
                          passengerNumber: 4),
                    ],
                  ),
                );
              })
            ],
          );
        }),
      ),
    );
  }
}
