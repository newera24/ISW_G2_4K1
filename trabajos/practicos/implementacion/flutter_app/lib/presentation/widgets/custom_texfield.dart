import 'package:flutter/material.dart';

import 'package:flutter_app/helpers/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.type,
    required this.hint,
    required this.label,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType type;
  final String hint;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.black,
      keyboardType: type,
      style: TextStyle(
          fontFamily: jaldi,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: violetaClaro,
          height: 1),
      decoration: InputDecoration(
          labelStyle: TextStyle(
              fontFamily: jaldi,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: violetaClaro,
              height: 1),
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintStyle: TextStyle(
              fontFamily: jaldi,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: violetaClaro,
              height: 1),
          border: InputBorder.none,
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
          contentPadding:
              const EdgeInsets.only(left: 8, bottom: 11, top: 11, right: 15),
          hintText: hint),
    );
  }
}
