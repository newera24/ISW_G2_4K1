import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/sushi_cart_controller.dart';
import 'package:flutter_app/helpers/constants.dart';
import 'package:flutter_app/models/product.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CartElement extends StatelessWidget {
  const CartElement({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    final SushiCartController cartController = Get.find<SushiCartController>();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: 330,
      height: 100,
      decoration: BoxDecoration(
        color: gris,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: grisOscuro, offset: const Offset(0, 1), blurRadius: 4)
        ],
      ),
      child: Row(children: <Widget>[
        Container(
            width: 10,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
              color: violetaClaro,
            )),
        SizedBox(width: 120, child: product.image),
        Container(
          width: 220,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), bottomLeft: Radius.circular(5))),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${product.name} x${product.ammount}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Color.fromRGBO(91, 91, 91, 1),
                    fontFamily: 'Jaldi',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Figma Flutter Generator 35400Widget - TEXT
                Row(
                  children: <Widget>[
                    Text(
                      '\$ ${product.price}0',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Jaldi',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        cartController.navigateToEdit(product);
                      },
                      child: const FaIcon(
                        FontAwesomeIcons.pen,
                        size: 18,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        cartController.removeProduct(product);
                      },
                      child: const FaIcon(
                        FontAwesomeIcons.trash,
                        size: 18,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
