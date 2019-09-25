import 'package:flutter/material.dart';

class DigitClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 3, size.height);
    path.lineTo(size.width / 1.5, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(DigitClipper oldClipper) => false;
}
