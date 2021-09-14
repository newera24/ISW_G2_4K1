import 'package:flutter_app/controllers/sushi_cart_controller.dart';
import 'package:flutter_app/controllers/home_controller.dart';
import 'package:get/instance_manager.dart';

class SushiBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SushiController());
    Get.put(SushiCartController());
  }
}
