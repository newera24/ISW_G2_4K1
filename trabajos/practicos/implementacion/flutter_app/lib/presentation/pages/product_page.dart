import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/sushi_cart_controller.dart';
import 'package:flutter_app/controllers/product_controller.dart';
import 'package:flutter_app/helpers/constants.dart';
import 'package:flutter_app/presentation/widgets/circular_button.dart';
import 'package:flutter_app/presentation/widgets/custom_texfield.dart';
import 'package:flutter_app/presentation/widgets/purple_button.dart';
import 'package:flutter_app/presentation/widgets/shopping_cart_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();

    return Container(
      color: violetaClaro,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          bottomNavigationBar: SizedBox(
            height: 100,
            width: context.width,
            child: Center(
              child: PurpleButton(
                  label: 'Agregar al carrito',
                  onPressed: () {
                    final SushiCartController cartController =
                        Get.find<SushiCartController>();
                    productController.addProductToCart();
                    cartController.getAmmountInCart();
                  }),
            ),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: SizedBox(
              width: context.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  _ProductContainer(),
                  _InfoContainer(),
                  _ContainerAclaracion(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ContainerAclaracion extends StatelessWidget {
  const _ContainerAclaracion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Observaciones',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: violeta,
                fontFamily: 'Jaldi',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 1),
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 120,
              width: context.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      offset: Offset(0, 2),
                      blurRadius: 4)
                ],
                color: gris,
              ),
              child: TextFormField(
                maxLength: 300,
                maxLines: 4,
                controller: productController.textEditingController,
                cursorColor: Colors.black,
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                    fontFamily: jaldi,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: violeta,
                    height: 1),
                decoration: InputDecoration(
                    labelStyle: TextStyle(
                        fontFamily: jaldi,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: violetaClaro,
                        height: 1),
                    hintStyle: TextStyle(
                        fontFamily: jaldi,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: violetaClaro,
                        height: 1),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.only(
                        left: 8, bottom: 11, top: 11, right: 15),
                    hintText: 'Ingrese una observación..'),
              )),
        ],
      ),
    );
  }
}

class _InfoContainer extends StatelessWidget {
  const _InfoContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: <Widget>[
          const _AmmountOption(),
          Divider(thickness: 5, color: violetaClaro),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 120,
            width: context.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(0, 2),
                    blurRadius: 4)
              ],
              color: gris,
            ),
            child: Text(
              ' ${productController.product.value.details}',
              style: const TextStyle(
                color: Color.fromRGBO(75, 75, 75, 1),
                fontFamily: 'Jaldi',
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AmmountOption extends StatelessWidget {
  const _AmmountOption({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Cantidad',
          style: TextStyle(
            color: violeta,
            fontFamily: 'Jaldi',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  productController.removeAmmount();
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: violetaClaro,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                      child: FaIcon(
                    FontAwesomeIcons.minus,
                    color: Colors.white,
                  )),
                ),
              ),
              Obx(
                () => Text(
                  '${productController.ammount}',
                  style: TextStyle(
                    color: violeta,
                    fontFamily: 'Jaldi',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  productController.addAmmount();
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: violetaClaro,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                      child: FaIcon(
                    FontAwesomeIcons.plus,
                    color: Colors.white,
                  )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProductContainer extends StatelessWidget {
  const _ProductContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: 500,
      decoration: BoxDecoration(
          color: violetaClaro,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            left: 10,
            top: 20,
            child: CircularButton(
              onPressed: () {
                Get.back();
              },
              icon: FaIcon(
                FontAwesomeIcons.arrowLeft,
                color: violetaClaro,
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 20,
            child: GestureDetector(
                onTap: () {
                  Get.toNamed('/cart');
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: 64,
                  height: 63,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(300),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(4, 4),
                          blurRadius: 40)
                    ],
                    color: Colors.white,
                  ),
                  child: ShoppingCartButton(
                      backgroundColor: Colors.white, color: violetaClaro),
                )),
          ),
          const _ProductImageCircle(),
          const _ProductInfo(),
        ],
      ),
    );
  }
}

class _ProductInfo extends StatelessWidget {
  const _ProductInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();
    return Positioned(
      top: 350,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: context.width,
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              productController.product.value.name,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: jaldi,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(color: Colors.white, thickness: 5),
            SizedBox(
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  FaIcon(FontAwesomeIcons.solidStar, color: Colors.amber),
                  FaIcon(FontAwesomeIcons.solidStar, color: Colors.amber),
                  FaIcon(FontAwesomeIcons.solidStar, color: Colors.amber),
                  FaIcon(FontAwesomeIcons.solidStar, color: Colors.amber),
                  FaIcon(FontAwesomeIcons.solidStar, color: Colors.amber),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '\$  ${productController.product.value.price}0',
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Jaldi',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'En stock',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Jaldi',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _ProductImageCircle extends StatelessWidget {
  const _ProductImageCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();
    return Positioned(
      top: 60,
      child: Container(
          padding: const EdgeInsets.all(30),
          width: 280,
          height: 280,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(300),
              topRight: Radius.circular(300),
              bottomLeft: Radius.circular(300),
              bottomRight: Radius.circular(300),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color.fromRGBO(40, 40, 40, 0.25),
                  offset: Offset(4, 4),
                  blurRadius: 30)
            ],
            color: Color.fromRGBO(245, 245, 245, 1),
          ),
          child: productController.product.value.image),
    );
  }
}
