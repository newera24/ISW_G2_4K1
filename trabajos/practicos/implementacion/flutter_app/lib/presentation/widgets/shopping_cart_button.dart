import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/sushi_cart_controller.dart';
import 'package:flutter_app/helpers/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ShoppingCartButton extends StatelessWidget {
  const ShoppingCartButton({
    Key? key,
    required this.backgroundColor,
    required this.color,
  }) : super(key: key);

  final Color backgroundColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final SushiCartController cartController = Get.find<SushiCartController>();

    return Stack(
      children: <Widget>[
        Positioned(
            bottom: 0,
            left: 0,
            child: FaIcon(
              FontAwesomeIcons.shoppingCart,
              color: color,
            )),
        Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                  color: color,
                  border: Border.all(
                    color: backgroundColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(16)),
              child: Center(
                child: Obx(
                  () => Text(
                    '${cartController.ammountInCart.value}',
                    style: TextStyle(
                        color: backgroundColor,
                        fontSize: 8,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
