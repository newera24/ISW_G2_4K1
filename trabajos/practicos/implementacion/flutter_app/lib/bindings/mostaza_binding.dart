import 'package:flutter_app/controllers/mostaza_controller.dart';
import 'package:get/instance_manager.dart';

class MostazaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MostazaController());
    //Get.put(SushiCartController());
  }
}
