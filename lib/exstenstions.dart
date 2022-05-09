import 'package:flutter/material.dart';

extension ColorExtension on String {
  toColor() {
    var hexColor = this.split('(0x')[1].split(')')[0];
    int value = int.parse(hexColor, radix: 16);
    return Color(value);
  }

}