import 'package:booking/const/segment_const.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../const/colors.dart';

import '../../controller.dart/itinerary/sagment_controller.dart';
import 'address_list.dart';
import 'custom_containers.dart';

class Sagments extends StatelessWidget {
  final int sagmentIndex;

  const Sagments({
    super.key,
    required this.sagmentIndex,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var sagmentcontroller = Get.put(SegmentController());
    final List<int> durations =
        List.generate(24 * 60 ~/ 5, (index) => (index + 1) * 5);
    return GetBuilder<SegmentController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: lime,
              ),
              borderRadius: BorderRadius.circular(5.h),
            ),
            height: 310.h,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                    decoration: const BoxDecoration(
                      color: lime,
                    ),
                    padding: EdgeInsets.only(left: 10.h),
                    alignment: Alignment.centerLeft,
                    height: 25.h,
                    width: double.infinity,
                    child: GetBuilder<SegmentController>(builder: (controller) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Segment $sagmentIndex",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () {
                                controller.removeSagment(sagmentIndex - 1);
                              },
                              icon: Icon(
                                FontAwesomeIcons.trash,
                                size: 12.h,
                                color: Colors.white,
                              ))
                        ],
                      );
                    })),
                //Date a time Row
                Obx(() {
                  return Padding(
                    padding: EdgeInsets.all(6.h),
                    child: Row(
                      children: [
                        Expanded(
                            child: LongIconContainer(
                                padding: 10.w,
                                txt: sagmentcontroller.selectedDate.value == ""
                                    ? "Date"
                                    : sagmentcontroller.selectedDate.value,
                                ontap: () {
                                  showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2022),
                                          lastDate: DateTime(2030))
                                      .then((date) {
                                    if (date == null) {
                                      return;
                                    }

                                    sagmentcontroller.selectedDate.value =
                                        DateFormat('dd MMMM yy').format(date);
                                  });
                                },
                                icon: FontAwesomeIcons.calendar)),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                            child: LongIconContainer(
                                padding: 10.w,
                                txt: sagmentcontroller.selectedTime.value == ""
                                    ? "Time"
                                    : sagmentcontroller.selectedTime.value,
                                ontap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((selectedTime) {
                                    if (selectedTime == null) {
                                      return;
                                    }

                                    final time = selectedTime.format(context);
                                    sagmentcontroller.selectedTime.value = time;
                                  });
                                },
                                icon: FontAwesomeIcons.clock)),
                      ],
                    ),
                  );
                }),
                //Duration ,
                Obx(() {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Row(
                      children: [
                        Expanded(
                            child: LongIconContainer(
                          txt: sagmentcontroller.hourAndMin.value == ""
                              ? "Duration"
                              : sagmentcontroller.hourAndMin.value,
                          ontap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: height / 1.5,
                                  child: ListView.builder(
                                    itemCount: durations.length,
                                    itemBuilder: (context, index) {
                                      final duration =
                                          Duration(minutes: durations[index]);
                                      final hours = duration.inHours;
                                      final minutes =
                                          duration.inMinutes.remainder(60);

                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context, {
                                            'hours': hours,
                                            'minutes': minutes
                                          });
                                        },
                                        child: ListTile(
                                          title: Text(
                                            '${hours > 0 ? '$hours hour ' : ''}$minutes min',
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ).then((selectedDuration) {
                              if (selectedDuration != null) {
                                final int hours = selectedDuration['hours'];
                                final int minutes = selectedDuration['minutes'];

                                sagmentcontroller.hourAndMin.value = hours == 0
                                    ? "$minutes min"
                                    : "$hours hr $minutes min";
                              }
                            });
                          },
                          icon: null,
                        )),
                        SizedBox(
                          width: 5.w,
                        ),
                        SmallBoxContainer(
                            ontap: () {
                              SegmentMethods.showFlightPopUp(
                                  context,
                                  sagmentcontroller.isInternational,
                                  sagmentcontroller.isDeparture);
                            },
                            icon: FontAwesomeIcons.plane),
                        SizedBox(
                          width: 5.w,
                        ),
                        SmallBoxContainer(
                            ontap: () {
                              SegmentMethods.showBagPopUp(context);
                            },
                            icon: FontAwesomeIcons.bagShopping),
                      ],
                    ),
                  );
                }),

                AddressBox(sagmentIndex: sagmentIndex),
                Padding(
                  padding: EdgeInsets.all(6.h),
                  child: Container(
                    padding: EdgeInsets.all(6.h),
                    height: 40.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.h),
                        border: Border.all(color: Colors.black12, width: 1)),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "Comments"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.h),
                  child: InkWell(
                    onTap: () {
                      SegmentMethods.openGoogleMaps("Badda dhaka", "comilla");
                    },
                    child: Row(
                      children: [
                        const Icon(FontAwesomeIcons.locationDot),
                        SizedBox(width: 15.w),
                        const Text(
                          "Preview on Google Maps",
                          style: TextStyle(color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      );
    });
  }
}

class DurationSelectionScreen extends StatelessWidget {
  final List<int> durations =
      List.generate(24 * 60 ~/ 5, (index) => (index + 1) * 5);

  DurationSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.access_time),
    );
  }
}
