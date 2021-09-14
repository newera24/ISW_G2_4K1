import 'package:flutter/material.dart';

class Product {
  Product(
      {required this.name,
      required this.price,
      required this.category,
      required this.isFaved,
      required this.image,
      required this.details,
      required this.ammount,
      required this.aclaracion});
  final String name;
  final double price;
  final String category;
  bool isFaved;
  final Image image;
  int ammount;
  final String details;
  String aclaracion;

  Product copyWith(
      {String? name,
      double? price,
      String? category,
      bool? isFaved,
      Image? image,
      String? details,
      String? aclaracion,
      int? ammount}) {
    return Product(
      aclaracion: aclaracion ?? this.aclaracion,
      name: name ?? this.name,
      price: price ?? this.price,
      category: category ?? this.category,
      isFaved: isFaved ?? this.isFaved,
      image: image ?? this.image,
      details: details ?? this.details,
      ammount: ammount ?? this.ammount,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is Product && other.name == name;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        price.hashCode ^
        category.hashCode ^
        image.hashCode ^
        details.hashCode;
  }
}
