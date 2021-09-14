import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_app/helpers/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: violeta,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  const _CustomAppBar(),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 10,
                    runSpacing: 20,
                    children: <Widget>[
                      _ShopItem(
                        asset: 'assets/images/sushi-world.png',
                        color: violetaClaro,
                        onPressed: () {
                          Get.toNamed('/sushi');
                        },
                        label: 'SUSHI WORLD',
                      ),
                      _ShopItem(
                        asset: 'assets/images/mostaza.png',
                        color: azul,
                        onPressed: () {
                          Get.toNamed('/mostaza');
                        },
                        label: 'MOSTAZA',
                      ),
                      _ShopItem(
                        asset: 'assets/images/burrito.png',
                        color: azulClaro,
                        onPressed: () {},
                        label: 'GUANAJUATO',
                      ),
                      _ShopItem(
                        asset: 'assets/images/papas.png',
                        color: celeste,
                        onPressed: () {},
                        label: 'POSTA',
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ShopItem extends StatelessWidget {
  const _ShopItem({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.color,
    required this.asset,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;
  final Color color;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 180,
        height: 158,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  offset: Offset(0, 1),
                  blurRadius: 4)
            ],
            color: gris),
        child: Column(
          children: <Widget>[
            Container(
              width: 187,
              height: 61,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                color: color,
              ),
              child: Center(
                child: Text(
                  label,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Jaldi',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Image.asset(
              asset,
              height: 90,
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
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'DeliverEat',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontFamily: jaldi,
                fontWeight: FontWeight.w800,
                fontSize: 30,
                height: 1,
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
