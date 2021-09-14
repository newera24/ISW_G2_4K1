import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/sushi_cart_controller.dart';
import 'package:flutter_app/controllers/cash_payment_controller.dart';
import 'package:flutter_app/controllers/delivery_controller.dart';
import 'package:flutter_app/controllers/resume_page_controller.dart';
import 'package:flutter_app/helpers/constants.dart';
import 'package:flutter_app/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_app/presentation/widgets/purple_border_container.dart';
import 'package:flutter_app/presentation/widgets/purple_button.dart';
import 'package:get/get.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ResumePageController resumePageController =
        Get.put(ResumePageController());

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
                        label: 'Finalizar Pago',
                        onPressed: () {
                          resumePageController.navigateToOrdenDone();
                        }))),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: SizedBox(
                height: context.height,
                width: context.width,
                child: Column(
                  children: <Widget>[
                    CustomAppBar(
                      onPressed: () {
                        Get.back();
                      },
                      title: 'RESUMEN',
                    ),
                    const SizedBox(height: 20),
                    const _TotalInfo(),
                    const SizedBox(height: 20),
                    const _DeliveryInfo(),
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
                  'Total Producto',
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

class _DeliveryInfo extends StatelessWidget {
  const _DeliveryInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DeliveryController deliveryController =
        Get.find<DeliveryController>();
    late final CashPaymentController cashPaymentController;

    if (deliveryController.cashSelected.value) {
      cashPaymentController = Get.find<CashPaymentController>();
    } else {
      cashPaymentController = Get.put(CashPaymentController());
    }

    final SushiCartController cartController = Get.find<SushiCartController>();
    return PurpleBorderContainer(
      width: context.width,
      height: 300,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Método de pago',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: violetaClaro,
                      fontFamily: 'Jaldi',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
                Text(
                  deliveryController.cashSelected.value
                      ? 'EFECTIVO'
                      : 'TARJETA',
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
                  'Entrega',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: violetaClaro,
                      fontFamily: 'Jaldi',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
                Text(
                  deliveryController.asSoonAsPosibleSelected.value
                      ? 'Lo antes posible'
                      : deliveryController.selectedTime.value.format(context),
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
            //Divider(thickness: 5, color: violetaClaro),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Pagas',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: violetaClaro,
                      fontFamily: 'Jaldi',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
                Text(
                  deliveryController.cashSelected.value
                      ? cashPaymentController.textEditController.value.text
                          .trim()
                      : '\$ ${cartController.total}0',
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
                  '${deliveryController.selectedCity}, ${deliveryController.textEditingControllerStreet.text.trim()} - ${deliveryController.textEditingControllerNumber.text.trim()}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Color.fromRGBO(137, 38, 194, 1),
                      fontFamily: 'Jaldi',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
              ],
            ),
            Container(
              child: Text(
                deliveryController.textEditingControllerReference.text,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Color.fromRGBO(137, 38, 194, 1),
                    fontFamily: 'Jaldi',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
