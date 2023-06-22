import 'package:get/get.dart';

import '../../widget/itinerary/address_list.dart';

class AddressController extends GetxController {
  RxList addresstList = [].obs;
  RxInt addressIndex = 0.obs;

  addAddress() {
    addresstList.add(AddressBoxDesign(
      sagmentIndex: 0,
      addressIndex: addresstList.length + 1,
    ));
  }

  void removeAddress(int index) {
    if (index > 0 && index < addresstList.length) {
      addresstList.removeAt(index);

      if (addressIndex.value >= addresstList.length) {
        addressIndex.value = addresstList.length - 1;
      }
    }
  }

  @override
  void onInit() {
    addresstList.value = [
      const AddressBoxDesign(
        addressIndex: 0,
        sagmentIndex: 0,
      )
    ];
    addAddress();

    super.onInit();
  }
}
