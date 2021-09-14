import 'package:flutter/material.dart';
import 'package:flutter_app/bindings/mostaza_binding.dart';
import 'package:flutter_app/bindings/sushi_binding.dart';
import 'package:flutter_app/presentation/pages/card_payment_page.dart';
import 'package:flutter_app/presentation/pages/cart_page.dart';
import 'package:flutter_app/presentation/pages/cash_payment_page.dart';
import 'package:flutter_app/presentation/pages/delivery_page.dart';
import 'package:flutter_app/presentation/pages/homepage.dart';
import 'package:flutter_app/presentation/pages/mostaza_page.dart';
import 'package:flutter_app/presentation/pages/sushiword_page.dart';
import 'package:flutter_app/presentation/pages/order_done_page.dart';
import 'package:flutter_app/presentation/pages/product_edit_page.dart';
import 'package:flutter_app/presentation/pages/product_page.dart';
import 'package:flutter_app/presentation/pages/resume_page.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      getPages: pages,
    ));

List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
  GetPage<dynamic>(
      name: '/sushi',
      page: () => const SushiWordPage(),
      binding: SushiBinding()),
  GetPage<dynamic>(
      name: '/mostaza',
      page: () => const MostazaPage(),
      binding: MostazaBinding()),
  GetPage<dynamic>(name: '/product', page: () => const ProductPage()),
  GetPage<dynamic>(name: '/home', page: () => const HomePage()),
  GetPage<dynamic>(name: '/edit', page: () => const ProductEditPage()),
  GetPage<dynamic>(name: '/cart', page: () => const CartPage()),
  GetPage<dynamic>(name: '/delivery', page: () => const DeliveryPage()),
  GetPage<dynamic>(name: '/cash', page: () => const CashPaymentPage()),
  GetPage<dynamic>(name: '/card', page: () => const CardPaymentPage()),
  GetPage<dynamic>(name: '/resume', page: () => const ResumePage()),
  GetPage<dynamic>(name: '/done', page: () => const OrderDonePage()),
];
