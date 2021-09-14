import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/card_payment.controller.dart';
import 'package:flutter_app/helpers/constants.dart';
import 'package:flutter_app/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_app/presentation/widgets/purple_button.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:get/get.dart';

class CardPaymentPage extends StatefulWidget {
  const CardPaymentPage({Key? key}) : super(key: key);

  @override
  _CardPaymentPageState createState() => _CardPaymentPageState();
}

class _CardPaymentPageState extends State<CardPaymentPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final CardPaymentController cardPaymentController =
        Get.put(CardPaymentController());

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
                          cardPaymentController.navigateToResume();
                        }))),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: SizedBox(
                height: context.height,
                width: context.width,
                child: Column(
                  children: <Widget>[
                    CustomAppBar(
                      onPressed: () {
                        Get.back();
                      },
                      title: 'TARJETA',
                    ),
                    const SizedBox(height: 20),
                    //const _TotalInfo(),
                    Obx(
                      () => CreditCardWidget(
                        obscureCardCvv: false,
                        cardNumber: cardPaymentController.cardNumber.value,
                        expiryDate: cardPaymentController.expiryDate.value,
                        cardHolderName:
                            cardPaymentController.cardHolderName.value,
                        cvvCode: cardPaymentController.cvvCode.value,
                        showBackView: cardPaymentController.isCvvFocused.value,
                      ),
                    ),
                    CreditCardForm(
                      formKey: _formKey, // Required
                      onCreditCardModelChange:
                          (CreditCardModel creditCardModel) {
                        cardPaymentController
                            .onCreditCardModelChange(creditCardModel);
                      }, // Required
                      themeColor: violetaClaro,
                      cardNumberDecoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Numero',
                        hintText: 'XXXX XXXX XXXX XXXX',
                      ),
                      expiryDateDecoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Fecha de Expiración',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Nombre',
                      ),
                      cardHolderName:
                          cardPaymentController.cardHolderName.value,
                      cardNumber: cardPaymentController.cardNumber.value,
                      cvvCode: cardPaymentController.cvvCode.value,
                      expiryDate: cardPaymentController.expiryDate.value,
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
