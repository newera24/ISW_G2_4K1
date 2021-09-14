import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryController extends GetxController {
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;

  RxBool cashSelected = true.obs;
  RxBool cardSelected = false.obs;
  RxBool asSoonAsPosibleSelected = true.obs;
  RxBool addressValid = false.obs;
  RxBool numberValid = false.obs;
  RxBool referenceValid = true.obs;
  late TextEditingController textEditingControllerStreet;
  late TextEditingController textEditingControllerNumber;
  late TextEditingController textEditingControllerReference;
  RxString selectedCity = 'Córdoba'.obs;

  @override
  void onInit() {
    textEditingControllerNumber = TextEditingController();
    textEditingControllerStreet = TextEditingController();
    textEditingControllerReference = TextEditingController();

    textEditingControllerStreet.addListener(() {
      if (textEditingControllerStreet.text.isNotEmpty) {
        addressValid.value = true;
      } else {
        addressValid.value = false;
      }
    });

    textEditingControllerNumber.addListener(() {
      if (textEditingControllerNumber.text.isNotEmpty) {
        numberValid.value = true;
      } else {
        numberValid.value = false;
      }
    });

    textEditingControllerReference.addListener(() {
      if (textEditingControllerReference.text.isEmpty) {
        referenceValid.value = true;
      } else {
        if (textEditingControllerReference.text.length > 5 &&
            textEditingControllerReference.text.length <= 300) {
          referenceValid.value = true;
        } else {
          referenceValid.value = false;
        }
      }
    });

    super.onInit();
  }

  @override
  void onClose() {
    textEditingControllerStreet.dispose();
    textEditingControllerNumber.dispose();
    textEditingControllerReference.dispose();

    super.onClose();
  }

  bool validateHour() {
    if (!asSoonAsPosibleSelected.value) {
      if (selectedTime.value.hour >= TimeOfDay.now().hour &&
          selectedTime.value.hour >= 8) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  void navigateToPayment() {
    if (cashSelected.value &&
        addressValid.value &&
        numberValid.value &&
        referenceValid.value &&
        validateHour()) {
      Get.toNamed('/cash');
    } else if (cardSelected.value &&
        addressValid.value &&
        numberValid.value &&
        referenceValid.value) {
      Get.toNamed('/card');
    } else {
      Get.snackbar('Error', 'Datos erróneos',
          forwardAnimationCurve: Curves.easeIn,
          reverseAnimationCurve: Curves.easeOut,
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.white,
          snackStyle: SnackStyle.FLOATING);
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) selectedTime.value = picked;
    // _hour.value = selectedTime.value.hour.toString();
    // _minute.value = selectedTime.value.minute.toString();

    // _timeController.text = _time;
    // _timeController.text = formatDate(
    //     DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
    //     [hh, ':', nn, " ", am]).toString();
  }
}
