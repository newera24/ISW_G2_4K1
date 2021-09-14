import 'package:flutter_app/controllers/product_controller.dart';
import 'package:flutter_app/models/product.dart';
import 'package:get/get.dart';

class SushiController extends GetxController {
  void navigateToProduct(Product product) {
    final ProductController productController = Get.put(ProductController());

    productController.textEditingController.text = product.aclaracion;

    productController.ammount.value = 1;
    productController.product.value = product;
    productController.textEditingController.text = product.aclaracion;

    Get.toNamed('/product');
  }
}
