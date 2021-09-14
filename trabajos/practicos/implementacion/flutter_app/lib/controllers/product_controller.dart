import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/sushi_cart_controller.dart';
import 'package:flutter_app/models/product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  late Rx<Product> product;
  late RxInt ammount;
  late TextEditingController textEditingController;
  RxBool isValid = true.obs;

  @override
  void onInit() {
    textEditingController = TextEditingController();
    ammount = 1.obs;
    product = Product(
            aclaracion: '',
            name: '',
            price: 0,
            category: '',
            isFaved: false,
            image: Image.asset('assets/images/sushi.png'),
            details: '',
            ammount: 1)
        .obs;

    textEditingController.text = product.value.aclaracion;

    textEditingController.addListener(() {
      if ((textEditingController.text.length <= 300 &&
              textEditingController.text.length >= 5) ||
          (textEditingController.text.isEmpty)) {
        isValid.value = true;
      } else {
        isValid.value = false;
      }
    });

    super.onInit();
  }

  void addProductToCart() {
    final SushiCartController cartController = Get.find<SushiCartController>();

    print(isValid.value);

    if (isValid.value) {
      if (cartController.cart.contains(product.value)) {
        final int index = cartController.cart.indexOf(product.value);

        final Product tempProduct = cartController.cart[index];

        cartController.cart[index] = product.value.copyWith(
            aclaracion: textEditingController.text,
            ammount: tempProduct.ammount + ammount.value);
      } else {
        cartController.cart.add(product.value.copyWith(
            ammount: ammount.value, aclaracion: textEditingController.text));
      }
      cartController.getSubTotal();

      Get.toNamed('/cart');
    } else {
      Get.snackbar('Error', 'Observacion Inválida.',
          forwardAnimationCurve: Curves.easeIn,
          reverseAnimationCurve: Curves.easeOut,
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.white,
          snackStyle: SnackStyle.FLOATING);
    }
  }

  void addAmmount() {
    ammount++;
  }

  void editProduct() {
    final SushiCartController cartController = Get.find<SushiCartController>();

    if (isValid.value) {
      for (final Product p in cartController.cart) {
        if (p == product.value) {
          p.aclaracion = textEditingController.text;
          p.ammount = ammount.value;
          break;
        }
      }
      Get.toNamed('/cart');
    } else {
      Get.snackbar('Error', 'Observacion Inválida.',
          forwardAnimationCurve: Curves.easeIn,
          reverseAnimationCurve: Curves.easeOut,
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.white,
          snackStyle: SnackStyle.FLOATING);
    }
  }

  void removeAmmount() {
    if (ammount.value > 1) {
      ammount--;
    }
  }
}
