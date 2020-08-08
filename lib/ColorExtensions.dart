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

extension GradientBoxDecorator on BoxDecoration {
  static BoxDecoration fromGradient(
      {Color topColor, Color bottomColor, int angle = 0}) {
    Alignment topAlignment;
    Alignment bottomAlignment;

    switch (angle) {
      case 0:
        {
          topAlignment = Alignment.topCenter;
          bottomAlignment = Alignment.bottomCenter;
          break;
        }
      case 90:
        {
          topAlignment = Alignment.centerLeft;
          bottomAlignment = Alignment.centerRight;
          break;
        }
      case 180:
        {
          topAlignment = Alignment.bottomCenter;
          bottomAlignment = Alignment.topCenter;
          break;
        }
      case 270:
        {
          topAlignment = Alignment.centerRight;
          bottomAlignment = Alignment.centerLeft;
          break;
        }
    }

    return BoxDecoration(
      gradient: LinearGradient(
          colors: [topColor, bottomColor],
          begin: topAlignment,
          end: bottomAlignment),
    );
  }
}
