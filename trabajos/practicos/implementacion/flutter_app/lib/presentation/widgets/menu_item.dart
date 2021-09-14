import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/home_controller.dart';
import 'package:flutter_app/helpers/constants.dart';
import 'package:flutter_app/models/product.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    final SushiController sushiController = Get.find<SushiController>();

    return GestureDetector(
      onTap: () {
        sushiController.navigateToProduct(widget.product);
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
              onTap: () {
                widget.product.isFaved = !widget.product.isFaved;
                setState(() {});
              },
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
