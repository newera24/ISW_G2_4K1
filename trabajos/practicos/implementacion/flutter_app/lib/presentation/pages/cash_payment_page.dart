import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/sushi_cart_controller.dart';
import 'package:flutter_app/controllers/cash_payment_controller.dart';
import 'package:flutter_app/helpers/constants.dart';
import 'package:flutter_app/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_app/presentation/widgets/purple_border_container.dart';
import 'package:flutter_app/presentation/widgets/purple_button.dart';
import 'package:get/get.dart';

class CashPaymentPage extends StatelessWidget {
  const CashPaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CashPaymentController cashPaymentController =
        Get.put(CashPaymentController());

    return Container(
      color: violetaClaro,
      child: SafeArea(
          bottom: false,
          child: Scaffold(
            bottomNavigationBar: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 100,
                child: Center(
                    child: PurpleButton(
                        label: 'Siguiente',
                        onPressed: () {
                          cashPaymentController.navigateToResume();
                        }))),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: SizedBox(
                height: context.height,
                width: context.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CustomAppBar(
                      onPressed: () {
                        Get.back();
                      },
                      title: 'EFECTIVO',
                    ),
                    const SizedBox(height: 20),
                    const _TotalInfo(),
                    const Spacer(),
                    Column(
                      children: <Widget>[
                        Text(
                          'Con cuanto vas a pagar?',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: violetaClaro,
                              fontFamily: 'Jaldi',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                        const SizedBox(height: 50),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          height: 84,
                          width: context.width,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            controller:
                                cashPaymentController.textEditController,
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              fontFamily: jaldi,
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: violetaClaro,
                            ),
                            decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    fontFamily: jaldi,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: violetaClaro,
                                    height: 1),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                    left: 8, bottom: 11, top: 11, right: 15),
                                hintText: ''),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(thickness: 5, color: violetaClaro),
                        ),
                      ],
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

class _TotalInfo extends StatelessWidget {
  const _TotalInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SushiCartController cartController = Get.find<SushiCartController>();
    return PurpleBorderContainer(
      width: context.width,
      height: 150,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total Productos',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: violetaClaro,
                      fontFamily: 'Jaldi',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
                Text(
                  '\$ ${cartController.subtotal}0',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Color.fromRGBO(137, 38, 194, 1),
                      fontFamily: 'Jaldi',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Costo envío',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: violetaClaro,
                      fontFamily: 'Jaldi',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
                const Text(
                  '\$ 30.00',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(137, 38, 194, 1),
                      fontFamily: 'Jaldi',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1),
                )
              ],
            ),
            Divider(thickness: 5, color: violetaClaro),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total Pedido',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: violetaClaro,
                      fontFamily: 'Jaldi',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
                Text(
                  '\$ ${cartController.total}0',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Color.fromRGBO(137, 38, 194, 1),
                      fontFamily: 'Jaldi',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
