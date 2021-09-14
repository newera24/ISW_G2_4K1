import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/widgets/cart_item.dart';
import 'package:flutter_app/presentation/widgets/custom_app_bar.dart';
import 'package:get/get.dart';

import 'package:flutter_app/controllers/sushi_cart_controller.dart';
import 'package:flutter_app/helpers/constants.dart';
import 'package:flutter_app/presentation/widgets/purple_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: violetaClaro,
      child: SafeArea(
          bottom: false,
          child: Scaffold(
            bottomNavigationBar: const _BottomAppBar(),
            backgroundColor: Colors.white,
            body: Column(
              children: <Widget>[
                CustomAppBar(
                  onPressed: () {
                    Get.toNamed('/sushi');
                  },
                  title: 'MI CARRITO',
                ),
                const _ProductList(),
              ],
            ),
          )),
    );
  }
}

class _ProductList extends StatelessWidget {
  const _ProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SushiCartController cartController = Get.find<SushiCartController>();
    return Obx(
      () => Expanded(
        child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: cartController.cart.length,
            itemBuilder: (BuildContext context, int index) => CartElement(
                  product: cartController.cart[index],
                )),
      ),
    );
  }
}

class _BottomAppBar extends StatelessWidget {
  const _BottomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SushiCartController cartController = Get.find<SushiCartController>();

    return SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: 360,
              height: 54,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Colors.white,
                border: Border.all(
                  color: violetaClaro,
                  width: 2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Total',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(137, 38, 194, 1),
                      fontFamily: 'Jaldi',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Obx(
                    () => Text(
                      '\$ ${cartController.subtotal.value}',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Color.fromRGBO(137, 38, 194, 1),
                        fontFamily: 'Jaldi',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            PurpleButton(
              label: 'Comprar ahora',
              onPressed: () {
                cartController.navigateToDelivery();
              },
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ));
  }
}
