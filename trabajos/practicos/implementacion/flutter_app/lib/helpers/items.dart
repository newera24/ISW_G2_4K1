import 'package:flutter/material.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/presentation/widgets/menu_item.dart';

List<MenuItem> itemsCombos = <MenuItem>[
  MenuItem(
    product: Product(
        aclaracion: '',
        name: '15 PIEZAS',
        price: 800.00,
        category: 'COMBO',
        isFaved: false,
        image: Image.asset('assets/images/combo-1.png'),
        details:
            'combo de 15 piezas variadas de sushi, nigiris, rolls calientes y frios',
        ammount: 1),
  ),
  MenuItem(
    product: Product(
        aclaracion: '',
        name: '30 PIEZAS',
        price: 1400.00,
        category: 'COMBO',
        isFaved: false,
        image: Image.asset('assets/images/combo-2.png'),
        details: 'combo de 30 piezas, salmon y rolls frios',
        ammount: 1),
  ),
];

List<MenuItem> itemsRolls = <MenuItem>[
  MenuItem(
    product: Product(
        aclaracion: '',
        name: 'MAKI',
        price: 50.00,
        category: 'ROLLS',
        isFaved: false,
        image: Image.asset('assets/images/sushi-roll-1.png'),
        details: 'pieza de palta, arroz y salmon',
        ammount: 1),
  ),
  MenuItem(
    product: Product(
        aclaracion: '',
        name: 'GUNKAN',
        price: 64.00,
        category: 'ROLLS',
        isFaved: false,
        image: Image.asset('assets/images/sushi-roll-2.png'),
        details: 'roll de arroz y salmon envuelto en algas',
        ammount: 1),
  ),
];

List<MenuItem> itemsBebida = <MenuItem>[
  MenuItem(
    product: Product(
        aclaracion: '',
        name: 'COCA COLA 2.25L',
        price: 354.00,
        category: 'BEBIDA',
        isFaved: false,
        image: Image.asset('assets/images/bebida-1.png'),
        details: '',
        ammount: 1),
  ),
  MenuItem(
    product: Product(
        aclaracion: '',
        name: 'SPRITE 2.25L',
        price: 354.00,
        category: 'BEBIDA',
        isFaved: false,
        image: Image.asset('assets/images/bebida-2.png'),
        details: '',
        ammount: 1),
  ),
];

List<MenuItem> itemsEnsaladas = <MenuItem>[
  MenuItem(
    product: Product(
        aclaracion: '',
        name: 'GOHAN MIXTO',
        price: 354.00,
        category: 'ENSALADA',
        isFaved: false,
        image: Image.asset('assets/images/gohan-1.png'),
        details: 'ensalada gohan de carne y fideos',
        ammount: 1),
  ),
  MenuItem(
    product: Product(
        aclaracion: '',
        name: 'GOHAN COMPLETO',
        price: 354.00,
        category: 'ENSALADA',
        isFaved: false,
        image: Image.asset('assets/images/gohan-2.png'),
        details: 'ensalada gohan de salsa, zanahoria, salmón, fideos y queso',
        ammount: 1),
  ),
];

List<MenuItem> itemsCaliente = <MenuItem>[
  MenuItem(
    product: Product(
        aclaracion: '',
        name: 'ASIAN NIKEI',
        price: 354.00,
        category: 'CALIENTE',
        isFaved: false,
        image: Image.asset('assets/images/roll-caliente-1.png'),
        details: 'roll caliente arroz salmon queso philadelphia',
        ammount: 1),
  ),
  MenuItem(
    product: Product(
        aclaracion: '',
        name: 'SAMISHI',
        price: 354.00,
        category: 'CALIENTE',
        isFaved: false,
        image: Image.asset('assets/images/roll-caliente-2.png'),
        details: 'roll caliente salmon ahumado queso philadelphia',
        ammount: 1),
  ),
];
