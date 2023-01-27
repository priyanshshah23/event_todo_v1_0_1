import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color whiteA7007f = fromHex('#7fffffff');

  static Color indigo400 = fromHex('#5f5dcc');

  static Color gray500 = fromHex('#a09d9d');

  static Color black900 = fromHex('#000000');

  static Color bluegray400 = fromHex('#888888');

  static Color gray900 = fromHex('#272626');

  static Color deepPurple400 = fromHex('#875dcc');

  static Color red400 = fromHex('#cc5d5d');

  static Color green700 = fromHex('#3e8832');

  static Color whiteA700 = fromHex('#ffffff');

  static Color gray100 = fromHex('#f5f5f5');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
