import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color fromHex(String hexCode) {
    String convertedRgbCode = hexCode.toUpperCase();
    convertedRgbCode = convertedRgbCode.replaceAll("#", "");
    if (convertedRgbCode.length == 6) {
      convertedRgbCode = "FF" + convertedRgbCode;
    }
    return Color(int.parse(convertedRgbCode, radix: 16));
  }
}
