import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/mostaza_controller.dart';

import 'package:flutter_app/helpers/constants.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/presentation/widgets/menu_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MostazaPage extends StatelessWidget {
  const MostazaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: violeta,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          floatingActionButton: const _CustomFloatingActionButton(),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  const _CustomAppBar(),
                  // const SizedBox(height: 10),
                  // const _SearchBar(),
                  _Category(
                      label: 'Hamburguesas',
                      color: violetaClaro,
                      menuItems: itemsHamburguesas),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Category extends StatelessWidget {
  const _Category({
    Key? key,
    required this.label,
    required this.menuItems,
    required this.color,
  }) : super(key: key);

  final String label;
  final List<_MenuItem> menuItems;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 20),
        _CategoryContainer(color: color, label: label),
        const SizedBox(height: 20),
        _MenuList(
          menuItems: menuItems,
        ),
      ],
    );
  }
}

class _CategoryContainer extends StatelessWidget {
  const _CategoryContainer({
    Key? key,
    required this.color,
    required this.label,
  }) : super(key: key);

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: 381,
        height: 65,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: color,
        ),
        child: // Figma Flutter Generator RollsWidget - TEXT
            Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            textAlign: TextAlign.left,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: jaldi,
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}

class _MenuList extends StatelessWidget {
  const _MenuList({
    Key? key,
    required this.menuItems,
  }) : super(key: key);

  final List<_MenuItem> menuItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: menuItems,
      ),
    );
  }
}

class _CustomFloatingActionButton extends StatelessWidget {
  const _CustomFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      backgroundColor: violeta,
      onPressed: () {
        // Get.toNamed('/cart');
      },
      child: SizedBox(
        width: 33,
        height: 33,
        child: Stack(
          children: <Widget>[
            const Positioned(
                bottom: 0,
                left: 0,
                child: FaIcon(
                  FontAwesomeIcons.shoppingCart,
                  color: Colors.white,
                )),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: violeta,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                  child: Text(
                    '0',
                    style: TextStyle(
                        color: violeta,
                        fontSize: 8,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: violeta,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
      height: 65,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: () {
                Get.toNamed('/home');
              },
              child: const FaIcon(
                FontAwesomeIcons.arrowLeft,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'MOSTAZA',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontFamily: jaldi,
                fontWeight: FontWeight.w800,
                fontSize: 30,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Align(
                alignment: Alignment.centerRight,
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.network(
                          'https://img2.freepng.es/20180630/ltq/kisspng-computer-icons-user-avatar-clip-art-skincare-cartoon-5b371025a6d8a7.5354815915303352696834.jpg'),
                    ))),
          ),
        ],
      ),
    );
  }
}

class _MenuItem extends StatefulWidget {
  const _MenuItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<_MenuItem> {
  @override
  Widget build(BuildContext context) {
    final MostazaController mostazaController = Get.find<MostazaController>();

    return GestureDetector(
      onTap: () {
        mostazaController.navigateToProduct(widget.product);
      },
      child: Container(
        height: 170,
        width: 165,
        decoration: BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
              color: grisOscuro, offset: const Offset(2, 2), blurRadius: 7),
        ], color: gris, borderRadius: BorderRadius.circular(5)),
        child: Stack(children: <Widget>[
          Positioned(
            right: 10,
            top: 10,
            child: GestureDetector(
              onTap: () {},
              child: FaIcon(FontAwesomeIcons.solidHeart,
                  color: widget.product.isFaved ? Colors.red : grisOscuro,
                  size: 22),
            ),
          ),
          Positioned(
              top: 18,
              left: 35,
              child: SizedBox(
                  width: 100, height: 100, child: widget.product.image)),
          Positioned(
            bottom: 0,
            child: ClipRRect(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                width: 165,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.product.name.toUpperCase(),
                        style: const TextStyle(
                          fontFamily: jaldi,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff5B5B5B),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '\$ ' + '${widget.product.price}',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontFamily: jaldi,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18,
                            height: 0),
                      )
                    ]),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

List<_MenuItem> itemsHamburguesas = <_MenuItem>[
  _MenuItem(
    product: Product(
        aclaracion: '',
        name: 'HAMBURGUESA',
        price: 500.00,
        category: 'ENSALADA',
        isFaved: false,
        image: Image.asset('assets/images/mostaza.png'),
        details: '',
        ammount: 1),
  ),
];
