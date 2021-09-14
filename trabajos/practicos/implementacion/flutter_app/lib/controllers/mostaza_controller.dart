import 'package:flutter_app/controllers/product_controller.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/presentation/pages/product_page_mostaza.dart';
import 'package:get/get.dart';

class MostazaController extends GetxController {
  void navigateToProduct(Product product) {
    final ProductController productController = Get.put(ProductController());

    productController.product.value = product;
    productController.product.value.aclaracion = product.aclaracion;

    Get.to(() => const ProductPageMostaza());
  }
}
