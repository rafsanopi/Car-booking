import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../controller.dart/itinerary/sagment_controller.dart';
import 'custom_containers.dart';

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final List<int> durations =
        List.generate(24 * 60 ~/ 5, (index) => (index + 1) * 5);
    List<String> occasionList = [
      'Birthday',
      'Anniversary',
      'Graduation',
      'Wedding',
      'Baby Shower',
      'Retirement',
      'Housewarming',
      'Engagement',
      'Promotion',
      'Valentine\'s Day',
      'Mother\'s Day',
      'Father\'s Day',
      'New Year\'s Day',
      'Christmas',
      'Thanksgiving',
      'Easter',
      'Halloween',
      'Independence Day',
      'Hanukkah',
      'Diwali'
    ];

    List<String> tripTypeList = ["One way", "Round", "Hourly"];
    var segmentController = Get.put(SegmentController());
    return Container(
      height: 120.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.h),
          border: Border.all(color: Colors.black12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.h),
              color: Colors.black,
            ),
            padding: EdgeInsets.only(left: 10.h),
            alignment: Alignment.centerLeft,
            height: 35.h,
            width: double.infinity,
            child: Text("Details",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                )),
          ),
          Obx(() {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.h),
              child: Row(
                children: [
                  Expanded(
                    child: ContainerWithIconText(
                        txt1: "Trip Type",
                        txt2: segmentController.tripType.value == ""
                            ? "--Trip Type--"
                            : segmentController.tripType.value,
                        ontap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: height / 4,
                                child: ListView.builder(
                                  itemCount: tripTypeList.length,
                                  itemBuilder: (context, index) {
                                    var tripType = tripTypeList[index];

                                    return InkWell(
                                      onTap: () {
                                        Navigator.pop(context, tripType);
                                      },
                                      child: ListTile(
                                        title: Text(
                                          tripType,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ).then((selectedtripType) {
                            if (selectedtripType != null) {
                              segmentController.tripType.value =
                                  selectedtripType;
                              print(segmentController.tripType.value);
                            }
                          });
                        },
                        icon: FontAwesomeIcons.locationDot),
                  ),
                ],
              ),
            );
          }),
          Obx(() {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.h),
              child: Row(
                children: [
                  Expanded(
                    child: ContainerWithIconText(
                        txt1: "Occasion",
                        txt2: segmentController.occasion.value == ""
                            ? "--Occasion--"
                            : segmentController.occasion.value,
                        ontap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: height / 1.5,
                                child: ListView.builder(
                                  itemCount: occasionList.length,
                                  itemBuilder: (context, index) {
                                    var occasion = occasionList[index];

                                    return InkWell(
                                      onTap: () {
                                        Navigator.pop(context, occasion);
                                      },
                                      child: ListTile(
                                        title: Text(
                                          occasion,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ).then((selectedOccasion) {
                            if (selectedOccasion != null) {
                              segmentController.occasion.value =
                                  selectedOccasion;
                            }
                          });
                        },
                        icon: FontAwesomeIcons.locationDot),
                  ),
                  Expanded(
                    child: ContainerWithIconText(
                        txt1: "Total Passenger",
                        txt2: segmentController.totalPasenger.value == 0
                            ? "--Total Passenger--"
                            : segmentController.totalPasenger.value.toString(),
                        ontap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: height / 1.5,
                                child: ListView.builder(
                                  itemCount: 100,
                                  itemBuilder: (context, index) {
                                    var newIndex = index + 1;
                                    return InkWell(
                                      onTap: () {
                                        Navigator.pop(context, newIndex);
                                      },
                                      child: ListTile(
                                        title: Text(
                                          newIndex.toString(),
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ).then((selectedIndex) {
                            if (selectedIndex != null) {
                              segmentController.totalPasenger.value =
                                  selectedIndex;
                            }
                          });
                        },
                        icon: FontAwesomeIcons.locationDot),
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
