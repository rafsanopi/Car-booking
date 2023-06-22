import 'package:booking/screens/contact_ui.dart';
import 'package:booking/screens/itinerary_ui.dart';
import 'package:booking/screens/summery.dart';
import 'package:booking/screens/vehical_ui.dart';
import 'package:booking/widget/itinerary/custom_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controller.dart/itinerary/sagment_controller.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> name = [
    "Trip Itinerary",
    "Vehicle\nSelection",
    "Contact Info",
    "Summary",
  ];

  @override
  Widget build(BuildContext context) {
    var sagmentController = Get.put(SegmentController());

    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() {
                return Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    //  this is the menu bar
                    LinkView(name: name),
                    SizedBox(
                      height: 10.h,
                    ),
                    //
                    //Main body
                    //
                    IndexedStack(
                      index: sagmentController.selectedContainerIndex.value,
                      children: const [
                        ItineraryScreen(),
                        VehicalScreen(),
                        ContactScreen(),
                        SummeryScreen()
                      ],
                    ),

                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PageContainer(
                            leftIcon: true,
                            ontap: () {
                              if (sagmentController
                                      .selectedContainerIndex.value >
                                  0) {
                                sagmentController
                                    .selectedContainerIndex.value--;
                              }
                            },
                            txt: "Privius"),
                        PageContainer(
                            ontap: () {
                              if (sagmentController
                                      .selectedContainerIndex.value <
                                  3) {
                                sagmentController
                                    .selectedContainerIndex.value++;
                              }
                            },
                            txt: sagmentController
                                        .selectedContainerIndex.value ==
                                    3
                                ? "Submit"
                                : "Next"),
                      ],
                    )
                  ],
                );
              })),
        ),
      ),
    );
  }
}

class LinkView extends StatefulWidget {
  const LinkView({super.key, required this.name});

  final List<String> name;

  @override
  // ignore: library_private_types_in_public_api
  _LinkViewState createState() => _LinkViewState();
}

class _LinkViewState extends State<LinkView> {
  @override
  Widget build(BuildContext context) {
    var sagmentController = Get.put(SegmentController());
    return GetBuilder<SegmentController>(builder: (controller) {
      return SizedBox(
        height: 40.h,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.name.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                controller.selectedContainerIndex.value = index;
              },
              child: Obx(() {
                return Container(
                  alignment: Alignment.center,
                  width: 85.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color:
                        sagmentController.selectedContainerIndex.value == index
                            ? const Color.fromARGB(255, 41, 40, 40)
                            : null,
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  child: Center(
                    child: Text(widget.name[index],
                        style: TextStyle(
                          fontSize: 11.sp,
                          color:
                              sagmentController.selectedContainerIndex.value ==
                                      index
                                  ? Colors.white
                                  : null,
                        )),
                  ),
                );
              }),
            );
          },
        ),
      );
    });
  }
}
