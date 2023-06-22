import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../controller.dart/itinerary/address_controller.dart';

class AddressBox extends StatelessWidget {
  final int sagmentIndex;

  const AddressBox({Key? key, required this.sagmentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var addressController = Get.put(AddressController());

    return Obx(() {
      final reversedList =
          addressController.addresstList.reversed.toList(); // Reverse the list

      return SizedBox(
        height: 110.h,
        width: double.infinity,
        child: ListView.builder(
          itemCount: reversedList.length,
          itemBuilder: (context, index) {
            final forwardIndex = index;
            final reversedIndex = reversedList.length - 1 - index;
            addressController.addressIndex.value = index;

            return AddressBoxDesign(
              addressIndex: index,
              sagmentIndex: sagmentIndex,
            );
          },
        ),
      );
    });
  }
}

class AddressBoxDesign extends StatelessWidget {
  final int addressIndex;
  final int sagmentIndex;

  const AddressBoxDesign(
      {super.key, required this.addressIndex, required this.sagmentIndex});

  @override
  Widget build(BuildContext context) {
    String alphabet = String.fromCharCode(65 + addressIndex);
    return Padding(
      padding: EdgeInsets.all(6.h),
      child: GetBuilder<AddressController>(builder: (controller) {
        return Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 35.h,
              width: 35.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.h),
                  border: Border.all(
                      color: alphabet == "A"
                          ? Colors.green
                          : addressIndex == controller.addresstList.length - 1
                              ? Colors.red
                              : Colors.orange,
                      width: 2)),
              child: Text(
                "$sagmentIndex $alphabet",
                style: TextStyle(
                    color: alphabet == "A"
                        ? Colors.green
                        : addressIndex == controller.addresstList.length - 1
                            ? Colors.red
                            : Colors.orange,
                    fontSize: 16.sp),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: Container(
                height: 35.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.h),
                    border: Border.all(
                      color: Colors.black12,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(2.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            addressIndex == 0
                                ? "Address (Pick up)"
                                : addressIndex ==
                                        controller.addresstList.length - 1
                                    ? "Address (Drop off)"
                                    : "Address (Stop)",
                            style: TextStyle(fontSize: 10.sp),
                          ),
                          SizedBox(
                            width: 80.w,
                            height: 15.h,
                            child: TextFormField(
                              showCursor: false,
                              textAlignVertical: TextAlignVertical.bottom,
                              cursorHeight: 10.sp,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(fontSize: 10.sp),
                                  hintText: "Enter a location"),
                            ),
                          )
                        ],
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Turn Autocompleate off",
                          style: TextStyle(fontSize: 8.sp, color: Colors.blue),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            SizedBox(
              height: 25.h,
              width: 25.h,
              child: IconButton.filled(
                  iconSize: 10.h,
                  onPressed: () {
                    controller.addAddress();
                  },
                  icon: const Icon(
                    FontAwesomeIcons.plus,
                  )),
            ),
            SizedBox(
              width: 5.w,
            ),
            SizedBox(
              height: 25.h,
              width: 25.h,
              child: IconButton.filled(
                  iconSize: 10.h,
                  onPressed: () {
                    controller.removeAddress(addressIndex - 1);
                  },
                  icon: const Icon(FontAwesomeIcons.xmark)),
            ),
          ],
        );
      }),
    );
  }
}
