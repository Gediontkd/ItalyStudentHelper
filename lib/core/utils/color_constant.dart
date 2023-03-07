import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color black9000a = fromHex('#0a000000');

  static Color gray5008e = fromHex('#8ea9a9a9');

  static Color gray500 = fromHex('#a1a1a1');

  static Color blueGray400 = fromHex('#878787');

  static Color lime600 = fromHex('#b6c23a');

  static Color blueGray50 = fromHex('#f1f1f1');

  static Color blueA400 = fromHex('#217aff');

  static Color lightBlueA400 = fromHex('#00b2fe');

  static Color gray900 = fromHex('#222222');

  static Color redA700Af = fromHex('#afff0000');

  static Color black9003f = fromHex('#3f000000');

  static Color gray200 = fromHex('#ededed');

  static Color gray300 = fromHex('#e4e4e4');

  static Color redA7008e = fromHex('#8eff0000');

  static Color teal300 = fromHex('#43ab93');

  static Color blueGray80005 = fromHex('#05373b4d');

  static Color indigo100 = fromHex('#c4c6d7');

  static Color black900 = fromHex('#000000');

  static Color bluegray400 = fromHex('#888888');

  static Color blue600E8 = fromHex('#e81e83ee');

  static Color blueGray400Af = fromHex('#af878787');

  static Color whiteA700 = fromHex('#ffffff');

  static Color whiteA7009e = fromHex('#9effffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
