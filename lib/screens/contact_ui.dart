import 'package:booking/controller.dart/contact.dart/contact_controller.dart';
import 'package:booking/widget/contact/custom_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var contactController = Get.put(ContactController());
    return GetBuilder<ContactController>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.all(6.h),
        child: Container(
          alignment: Alignment.topLeft,
          height: 300.h,
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
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
                child: Text("Your Information",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(6.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                            child: ContainerIconTxtTxteditingForm(
                          icon: FontAwesomeIcons.person,
                          txt: "First name",
                        )),
                        SizedBox(
                          width: 5.w,
                        ),
                        const Expanded(
                            child: ContainerIconTxtTxteditingForm(
                          icon: FontAwesomeIcons.person,
                          txt: "Last name",
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        const Expanded(
                            child: ContainerIconTxtTxteditingForm(
                          icon: FontAwesomeIcons.house,
                          txt: "Company name",
                        )),
                        SizedBox(
                          width: 5.w,
                        ),
                        const Expanded(
                            child: ContainerIconTxtTxteditingForm(
                          icon: FontAwesomeIcons.envelope,
                          txt: "Email address",
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    const Row(
                      children: [
                        Expanded(
                            child: ContainerIconTxtTxteditingForm(
                          icon: FontAwesomeIcons.phone,
                          txt: "Primary number",
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    const Row(
                      children: [
                        Expanded(
                            child: ContainerIconTxtTxteditingForm(
                          icon: FontAwesomeIcons.phone,
                          txt: "Secondary number",
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Are you also a passenger?"),
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Obx(() {
                      return Row(
                        children: [
                          ContactButton(
                              selectTxt: "Yes",
                              backgroundColor:
                                  contactController.boxIndex.value == 0
                                      ? Colors.green
                                      : Colors.blue,
                              ontap: () {
                                controller.boxIndex.value = 0;
                              },
                              icon: FontAwesomeIcons.check),
                          SizedBox(
                            width: 6.w,
                          ),
                          ContactButton(
                              selectTxt: "No",
                              backgroundColor:
                                  contactController.boxIndex.value == 1
                                      ? Colors.green
                                      : Colors.blue,
                              ontap: () {
                                controller.boxIndex.value = 1;
                              },
                              icon: FontAwesomeIcons.xmark),
                        ],
                      );
                    })
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
