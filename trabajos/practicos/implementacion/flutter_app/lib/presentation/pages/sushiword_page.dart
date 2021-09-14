import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/sushi_cart_controller.dart';
import 'package:flutter_app/presentation/widgets/custom_texfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:flutter_app/helpers/constants.dart';
import 'package:flutter_app/helpers/items.dart';
import 'package:flutter_app/presentation/widgets/menu_item.dart';
import 'package:flutter_app/presentation/widgets/shopping_cart_button.dart';

class SushiWordPage extends StatelessWidget {
  const SushiWordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: violeta,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          floatingActionButton: const _CustomFloatingActionButton(),
          backgroundColor: violeta,
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  const _CustomAppBar(),
                  // const SizedBox(height: 10),
                  //const _SearchBar(),
                  _Category(
                      label: 'COMBOS',
                      color: violetaClaro,
                      menuItems: itemsCombos),
                  _Category(label: 'ROLLS', color: azul, menuItems: itemsRolls),
                  _Category(
                      label: 'ENSALDAS',
                      color: azulClaro,
                      menuItems: itemsEnsaladas),
                  _Category(
                      label: 'ROLLS CALIENTES',
                      color: celeste,
                      menuItems: itemsCaliente),
                  _Category(
                      label: 'BEBIDAS',
                      color: celesteClaro,
                      menuItems: itemsBebida),
                  const SizedBox(height: 30),
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
  final List<MenuItem> menuItems;
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
        final SushiCartController sushiCartController =
            Get.find<SushiCartController>();
        sushiCartController.getSubTotal();
        Get.toNamed('/cart');
      },
      child: SizedBox(
        width: 33,
        height: 33,
        child: ShoppingCartButton(
          color: Colors.white,
          backgroundColor: violeta,
        ),
      ),
    );
  }
}

class _MenuList extends StatelessWidget {
  const _MenuList({
    Key? key,
    required this.menuItems,
  }) : super(key: key);

  final List<MenuItem> menuItems;

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

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 45,
      decoration: BoxDecoration(
          color: gris,
          borderRadius: const BorderRadius.all(Radius.circular(26))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: CustomTextField(
              label: '',
              hint: 'Buscar',
              type: TextInputType.name,
              controller: TextEditingController(),
            ),
          ),
          FaIcon(
            FontAwesomeIcons.search,
            color: grisOscuro,
          ),
        ],
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
              'SUSHI WORLD',
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
