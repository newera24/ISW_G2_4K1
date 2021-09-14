import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:get/get.dart';

class CardPaymentController extends GetxController {
  RxString cardNumber = ''.obs;
  RxString expiryDate = ''.obs;
  RxString cardHolderName = ''.obs;
  RxString cvvCode = ''.obs;
  RxBool isCvvFocused = false.obs;
  RxBool cardValid = true.obs;

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    cardNumber.value = creditCardModel!.cardNumber;
    expiryDate.value = creditCardModel.expiryDate;
    cardHolderName.value = creditCardModel.cardHolderName;
    cvvCode.value = creditCardModel.cvvCode;
    isCvvFocused.value = creditCardModel.isCvvFocused;
  }

  bool validateExpirityDate() {
    final int month = int.parse(expiryDate.substring(0, 2));
    final int year = int.parse(expiryDate.substring(3)) + 2000;

    final int actualMonth = DateTime.now().month.toInt();
    final int actualYear = DateTime.now().year.toInt();

    if (month <= 12 && month >= 1) {
      if (year > actualYear) {
        return true;
      } else if (year == actualYear) {
        if (month >= actualMonth) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  bool validateCvv() {
    if (cvvCode.value.length == 3) {
      return true;
    } else {
      return false;
    }
  }

  bool validateCard() {
    if (cardNumber.value.substring(0, 1) == '4' &&
        cardNumber.value != '' &&
        expiryDate.value != '' &&
        cardHolderName.value != '' &&
        cvvCode.value != '' &&
        validateExpirityDate() &&
        validateCvv()) {
      return true;
    } else {
      return false;
    }
  }

  void navigateToResume() {
    if (validateCard()) {
      Get.toNamed('/resume');
    } else {
      Get.snackbar('Error', 'Tarjeta Inválida',
          forwardAnimationCurve: Curves.easeIn,
          reverseAnimationCurve: Curves.easeOut,
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.white,
          snackStyle: SnackStyle.FLOATING);
    }
  }
}
