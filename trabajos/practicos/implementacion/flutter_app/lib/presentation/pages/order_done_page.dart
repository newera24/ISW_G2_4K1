import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/order_done_controller.dart';
import 'package:flutter_app/helpers/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class OrderDonePage extends GetWidget<OrderDoneController> {
  const OrderDonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: violetaClaro,
        width: context.width,
        height: context.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Tu pedido fue\nrealizado con exito!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Jaldi',
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  height: 1),
            ),
            SizedBox(height: 40),
            FaIcon(
              FontAwesomeIcons.solidCheckCircle,
              color: Colors.white,
              size: 200,
            )
          ],
        ),
      ),
    );
  }
}
