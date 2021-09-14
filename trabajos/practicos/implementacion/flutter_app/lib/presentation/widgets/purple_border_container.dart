import 'package:flutter/material.dart';

import 'package:flutter_app/helpers/constants.dart';

class PurpleBorderContainer extends StatelessWidget {
  const PurpleBorderContainer({
    Key? key,
    required this.child,
    required this.width,
    required this.height,
  }) : super(key: key);

  final Widget child;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          color: Colors.white,
          border: Border.all(
            color: violetaClaro,
            width: 2,
          ),
        ),
        child: child);
  }
}
