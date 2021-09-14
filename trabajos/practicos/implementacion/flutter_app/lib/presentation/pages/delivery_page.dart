import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/controllers/delivery_controller.dart';
import 'package:flutter_app/presentation/widgets/custom_texfield.dart';
import 'package:flutter_app/presentation/widgets/purple_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:flutter_app/helpers/constants.dart';
import 'package:flutter_app/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_app/presentation/widgets/purple_border_container.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DeliveryController deliveryController =
        Get.find<DeliveryController>();
    return Container(
      color: violetaClaro,
      child: SafeArea(
          bottom: false,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CustomAppBar(
                    onPressed: () {
                      Get.back();
                    },
                    title: 'ENTREGA',
                  ),
                  const SizedBox(height: 20),
                  const _DeliveryInputs(),
                  const _DeliveryPaymentOptions(),
                  const _DeliveryTimeOptions(),
                  const SizedBox(height: 20),
                  PurpleButton(
                      label: 'Ir a pago',
                      onPressed: () {
                        deliveryController.navigateToPayment();
                      }),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          )),
    );
  }
}

class _DeliveryTimeOptions extends StatelessWidget {
  const _DeliveryTimeOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DeliveryController deliveryController =
        Get.find<DeliveryController>();
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Cuando queres recibirlo?',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: violetaClaro,
                  fontFamily: 'Jaldi',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: <Widget>[
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        deliveryController.asSoonAsPosibleSelected.value =
                            !deliveryController.asSoonAsPosibleSelected.value;
                      },
                      child: _CustomCheck(
                        isChecked:
                            deliveryController.asSoonAsPosibleSelected.value,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Lo antes posible',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: violetaClaro,
                      fontFamily: 'Jaldi',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Seleccione un horario',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: violetaClaro,
                      fontFamily: 'Jaldi',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                      onTap: () async {
                        await deliveryController.selectTime(context);
                        deliveryController.asSoonAsPosibleSelected.value =
                            false;
                      },
                      child: Container(
                        width: 160,
                        height: 50,
                        decoration: BoxDecoration(
                            color: gris,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                            child: Obx(
                          () => Text(
                            deliveryController.selectedTime.value
                                .format(context),
                            style: TextStyle(
                                color: !deliveryController
                                        .asSoonAsPosibleSelected.value
                                    ? Colors.black
                                    : gris,
                                fontFamily: jaldi,
                                fontSize: 30),
                          ),
                        )),
                      ))
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DeliveryPaymentOptions extends StatelessWidget {
  const _DeliveryPaymentOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeliveryController deliveryController = Get.put(DeliveryController());

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 170,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Divider(
            thickness: 5,
            color: violetaClaro,
          ),
          Text(
            'Como vas a pagar?',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: violetaClaro,
                fontFamily: 'Jaldi',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1),
          ),
          Obx(
            () => Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    deliveryController.cashSelected.value = true;

                    deliveryController.cardSelected.value = false;
                  },
                  child: _CustomCheck(
                    isChecked: deliveryController.cashSelected.value,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'Efectivo',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: violetaClaro,
                    fontFamily: 'Jaldi',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  deliveryController.cashSelected.value = false;

                  deliveryController.cardSelected.value = true;
                },
                child: Obx(
                  () => _CustomCheck(
                    isChecked: deliveryController.cardSelected.value,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Tarjeta',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: violetaClaro,
                  fontFamily: 'Jaldi',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Divider(
            thickness: 5,
            color: violetaClaro,
          ),
        ],
      ),
    );
  }
}

class _CustomCheck extends StatelessWidget {
  const _CustomCheck({
    Key? key,
    required this.isChecked,
  }) : super(key: key);

  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Colors.white,
        border: Border.all(
          color: violetaClaro,
          width: 3,
        ),
      ),
      child: isChecked
          ? Center(
              child: FaIcon(FontAwesomeIcons.solidCheckCircle,
                  size: 23, color: violetaClaro))
          : Container(),
    );
  }
}

class _DeliveryInputs extends StatelessWidget {
  const _DeliveryInputs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DeliveryController deliveryController =
        Get.find<DeliveryController>();

    return Column(
      children: <Widget>[
        Obx(
          () => PurpleBorderContainer(
            width: context.width,
            height: 50,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  value: deliveryController.selectedCity.value,
                  hint: Text(
                    'Ciudad',
                    style: TextStyle(
                        fontFamily: jaldi,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: violetaClaro),
                  ),
                  onChanged: (String? value) {
                    if (value != null) {
                      deliveryController.selectedCity.value = value;
                    }
                  },
                  items: ciudades
                      .map((String ciudad) => DropdownMenuItem<String>(
                          value: ciudad,
                          child: Text(
                            ciudad,
                            style: TextStyle(
                                fontFamily: jaldi,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: violetaClaro),
                          )))
                      .toList()),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: 220,
                height: 50,
                child: CustomTextField(
                    label: 'Dirección',
                    hint: '',
                    controller: deliveryController.textEditingControllerStreet,
                    type: TextInputType.streetAddress)),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: 90,
                height: 50,
                child: CustomTextField(
                    label: 'Nro',
                    hint: '',
                    controller: deliveryController.textEditingControllerNumber,
                    type: TextInputType.number))
          ],
        ),
        const SizedBox(height: 10),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: context.width,
            height: 120,
            child: TextFormField(
              maxLength: 300,
              maxLines: 4,
              controller: deliveryController.textEditingControllerReference,
              cursorColor: Colors.black,
              keyboardType: TextInputType.multiline,
              style: TextStyle(
                  fontFamily: jaldi,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: violetaClaro,
                  height: 1),
              decoration: InputDecoration(
                counterStyle: TextStyle(
                    fontFamily: jaldi,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: violetaClaro,
                    height: 1),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                labelText: 'Referencia (Opcional)',
                alignLabelWithHint: true,
                labelStyle: TextStyle(
                  fontFamily: jaldi,
                  fontWeight: FontWeight.bold,
                  color: violetaClaro,
                ),
                hintStyle: TextStyle(
                    fontFamily: jaldi,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: violetaClaro,
                    height: 1),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: violetaClaro, width: 2.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: violetaClaro, width: 2.5),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.red, width: 2.5),
                ),
                contentPadding: const EdgeInsets.only(
                    left: 8, bottom: 11, top: 11, right: 15),
              ),
            )),
        const SizedBox(height: 10),
      ],
    );
  }
}
