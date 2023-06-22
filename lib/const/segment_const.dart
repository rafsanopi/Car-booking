import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';
import '../controller.dart/itinerary/sagment_controller.dart';
import '../widget/itinerary/custom_containers.dart';

class SegmentMethods {
  var sagmentController = Get.put(SegmentController());

  static showFlightPopUp(
      BuildContext context, RxBool isInternational, RxBool isDeparture) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: GetBuilder<SegmentController>(builder: (controller) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.w),
                          color: const Color.fromARGB(255, 21, 18, 58),
                        ),
                        alignment: Alignment.center,
                        height: 30.h,
                        child: const Text(
                          'Flight Info',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Obx(() {
                  return Row(
                    children: [
                      Expanded(
                        child: LongIconContainer(
                            isBlue:
                                isInternational.value == true ? false : true,
                            backgrondColor: isInternational.value == true
                                ? Colors.white
                                : Colors.blue,
                            txtSize: 8.sp,
                            txt: "International",
                            ontap: () {
                              controller.isInternational.value =
                                  !controller.isInternational.value;
                            },
                            icon: FontAwesomeIcons.earthAmericas),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                        child: LongIconContainer(
                            isBlue:
                                isInternational.value == false ? false : true,
                            backgrondColor: isInternational.value == false
                                ? Colors.white
                                : Colors.blue,
                            txtSize: 8.sp,
                            txt: "Domestic",
                            ontap: () {
                              controller.isInternational.value =
                                  !controller.isInternational.value;
                            },
                            icon: FontAwesomeIcons.earthAmericas),
                      )
                    ],
                  );
                }),
                SizedBox(
                  height: 5.h,
                ),
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: LongIconContainer(
                            isBlue: isDeparture.value == true ? false : true,
                            backgrondColor: isDeparture.value == true
                                ? Colors.white
                                : Colors.blue,
                            txtSize: 8.sp,
                            txt: "Departure",
                            ontap: () {
                              controller.isDeparture.value =
                                  !controller.isDeparture.value;
                            },
                            icon: FontAwesomeIcons.planeDeparture),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                        child: LongIconContainer(
                            isBlue: isDeparture.value == false ? false : true,
                            backgrondColor: isDeparture.value == false
                                ? Colors.white
                                : Colors.blue,
                            txtSize: 8.sp,
                            txt: "Arrival",
                            ontap: () {
                              controller.isDeparture.value =
                                  !controller.isDeparture.value;
                            },
                            icon: FontAwesomeIcons.planeArrival),
                      )
                    ],
                  );
                }),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  height: 35.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.h),
                      border: Border.all(
                        color: Colors.black12,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //Icon(FontAwesomeIcons.plane, size: 10.w),
                      Padding(
                        padding: EdgeInsets.all(2.h),
                        child: Column(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Flight#",
                              style: TextStyle(fontSize: 10.sp),
                            ),
                            SizedBox(
                              width: 120.w,
                              height: 15.h,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.w),
                                child: TextFormField(
                                  showCursor: false,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  cursorHeight: 10.sp,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(fontSize: 10.sp),
                                      hintText: "Enter"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
          actions: [
            TextButton(
              onPressed: () {
                // Perform action for the "Save" button
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                // Perform action for the "Close" button
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  static showBagPopUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: GetBuilder<SegmentController>(builder: (controller) {
            return const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropDownWithTxt(txt: "Small"),
                DropDownWithTxt(txt: "Medium"),
                DropDownWithTxt(txt: "Large"),
              ],
            );
          }),
          actions: [
            TextButton(
              onPressed: () {
                // Perform action for the "Save" button
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                // Perform action for the "Close" button
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  static openGoogleMaps(String pickupLocation, String dropLocation) {
    MapsLauncher.launchQuery(
      'https://www.google.com/maps/dir/?api=1&origin=$pickupLocation&destination=$dropLocation&travelmode=driving',
      //"$pickupLocation, $dropLocation"
    );
  }
}

class DropDownWithTxt extends StatelessWidget {
  final String txt;
  const DropDownWithTxt({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    final List<int> numberList = List.generate(55, (index) => index + 1);

    return Container(
        margin: EdgeInsets.only(bottom: 5.h),
        height: 35.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("$txt bags"),
            SizedBox(
              width: 120.w,
              height: 35.h,
              child: DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // Add more decoration..
                ),
                hint: const Text(
                  'Select',
                  style: TextStyle(fontSize: 14),
                ),
                items: numberList
                    .map((item) => DropdownMenuItem(
                          value: item.toString(),
                          child: Text(
                            item.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'select';
                  }
                  return null;
                },
                onChanged: (value) {
                  //Do something when selected item is changed.
                },
                onSaved: (value) {},
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(right: 8),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 24,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
          ],
        ));
  }
}
