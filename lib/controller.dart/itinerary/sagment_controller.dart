import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widget/itinerary/sagment.dart';

class SegmentController extends GetxController {
  RxList sagmentList = [].obs;
  RxBool isInternational = false.obs;
  RxBool isDeparture = false.obs;
  RxInt totalPasenger = 0.obs;
  RxString tripType = "".obs;
  RxString occasion = "".obs;
  RxInt selectedContainerIndex = 0.obs;
  RxBool isdeparture = false.obs;

  RxInt sagmentIndex = 0.obs;
  RxString selectedDate = "".obs;
  RxString selectedTime = "".obs;
  RxString hourAndMin = "".obs;

  RxDouble containerHeight = 410.h.obs;
  RxDouble listViewHeight = 320.h.obs;

  multiplyNewheight() {
    containerHeight.value = (410.h * 1.1).h;
    listViewHeight.value = (320.h * 1.1).h;
  }

  devideNewheight() {
    if (sagmentIndex.value != 0) {
      containerHeight.value = 410.h;
      listViewHeight.value = 320.h;
    }
  }

  addSagment() {
    sagmentList.add(Sagments(
      sagmentIndex: sagmentList.length + 1,
    ));
  }

  void removeSagment(int index) {
    if (index > 0 && index < sagmentList.length) {
      devideNewheight();
      sagmentList.removeAt(index);

      if (sagmentIndex.value >= sagmentList.length) {
        sagmentIndex.value = sagmentList.length - 1;
      }
    }
  }

  @override
  void onInit() {
    sagmentList.value = [
      const Sagments(
        sagmentIndex: 0,
      )
    ];
    super.onInit();
  }
}
