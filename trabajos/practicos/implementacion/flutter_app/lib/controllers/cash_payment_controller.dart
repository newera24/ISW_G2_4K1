import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/sushi_cart_controller.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';

class CashPaymentController extends GetxController {
  late MoneyMaskedTextController textEditController;
  RxBool validAmmount = false.obs;

  @override
  void onInit() {
    textEditController = MoneyMaskedTextController(
        decimalSeparator: '.', thousandSeparator: ',', leftSymbol: '\$ ');

    super.onInit();
  }

  void validateAmmount() {
    final SushiCartController cartController = Get.find<SushiCartController>();
    if (double.parse(textEditController.numberValue.toString()) <
        cartController.total.value) {
      validAmmount.value = false;
    } else {
      validAmmount.value = true;
    }
  }

  void navigateToResume() {
    validateAmmount();
    if (validAmmount.value) {
      Get.toNamed('/resume');
    } else {
      Get.snackbar('Error', 'Monto inválido',
          forwardAnimationCurve: Curves.easeIn,
          reverseAnimationCurve: Curves.easeOut,
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.white,
          snackStyle: SnackStyle.FLOATING);
    }
  }

  @override
  void onClose() {
    textEditController.dispose();
    super.onClose();
  }
}
