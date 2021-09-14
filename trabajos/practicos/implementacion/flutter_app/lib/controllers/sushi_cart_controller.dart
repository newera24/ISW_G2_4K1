import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/delivery_controller.dart';
import 'package:flutter_app/controllers/product_controller.dart';
import 'package:flutter_app/models/product.dart';
import 'package:get/get.dart';

class SushiCartController extends GetxController {
  RxList<Product> cart = RxList<Product>();
  final RxDouble subtotal = 0.0.obs;
  final RxDouble total = 0.0.obs;
  final RxInt ammountInCart = 0.obs;

  void reset() {
    cart.clear();
    ammountInCart.value = 0;
    total.value = 0;
  }

  void getAmmountInCart() {
    int tempAmmount = 0;

    cart.forEach((Product product) {
      tempAmmount += product.ammount;
    });

    ammountInCart.value = tempAmmount;
  }

  void getSubTotal() {
    double tempTotal = 0;

    cart.forEach((Product product) {
      tempTotal += (product.price) * (product.ammount);
    });

    subtotal.value = tempTotal;
    total.value = subtotal.value + 30;
  }

  void removeProduct(Product product) {
    cart.remove(product);
    getAmmountInCart();
    getSubTotal();
  }

  void navigateToEdit(Product product) {
    final ProductController productController = Get.put(ProductController());
    productController.ammount.value = product.ammount;
    productController.product.value = product;
    productController.textEditingController.text = product.aclaracion;
    Get.toNamed('/edit');
  }

  void navigateToDelivery() {
    if (cart.isNotEmpty) {
      Get.put(DeliveryController());
      Get.toNamed('/delivery');
    } else {
      Get.snackbar('Error', 'El carrito esta vacio',
          forwardAnimationCurve: Curves.easeIn,
          reverseAnimationCurve: Curves.easeOut,
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.white,
          snackStyle: SnackStyle.FLOATING);
    }
  }
}
