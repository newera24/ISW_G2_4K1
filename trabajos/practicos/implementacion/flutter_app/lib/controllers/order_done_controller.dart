import 'dart:async';

import 'package:flutter_app/controllers/sushi_cart_controller.dart';
import 'package:get/get.dart';

class OrderDoneController extends GetxController {
  @override
  void onReady() {
    navigateToHome();
    super.onReady();
  }

  void navigateToHome() {
    final SushiCartController cartController = Get.find<SushiCartController>();

    Timer(const Duration(seconds: 2), () => Get.toNamed('/home'));
    cartController.reset();
  }
}
