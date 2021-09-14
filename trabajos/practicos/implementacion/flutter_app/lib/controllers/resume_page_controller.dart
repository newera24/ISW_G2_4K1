import 'package:flutter_app/controllers/order_done_controller.dart';
import 'package:get/get.dart';

class ResumePageController extends GetxController {
  void navigateToOrdenDone() {
    Get.create(() => OrderDoneController());
    Get.toNamed('/done');
  }
}
