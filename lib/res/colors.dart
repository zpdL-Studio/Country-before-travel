import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class color {
  static const Color transparent = Colors.transparent;

  static const white = Colors.white;
  static const black = Colors.black;

  static const ultimate_gray = Color.fromARGB(0xFF, 147, 149, 151); /// 0x939597
  static const cloud_dance = Color.fromARGB(0xFF, 240, 238, 233); /// 0xF0EEE9
  static const illuminating = Color.fromARGB(0xFF, 245, 223, 77); /// 0xF5DF4D
}

extension ColorTextStyle on Color {
  TextStyle get headline1 {
    return colorToTextStyle(Get.textTheme.headline1);
  }
  TextStyle get headline2 {
    return colorToTextStyle(Get.textTheme.headline2);
  }
  TextStyle get headline3 {
    return colorToTextStyle(Get.textTheme.headline3);
  }
  TextStyle get headline4 {
    return colorToTextStyle(Get.textTheme.headline4);
  }
  TextStyle get headline5 {
    return colorToTextStyle(Get.textTheme.headline5);
  }
  TextStyle get headline6 {
    return colorToTextStyle(Get.textTheme.headline6);
  }
  TextStyle get subtitle1 {
    return colorToTextStyle(Get.textTheme.subtitle1);
  }
  TextStyle get subtitle2 {
    return colorToTextStyle(Get.textTheme.subtitle2);
  }
  TextStyle get bodyText1 {
    return colorToTextStyle(Get.textTheme.bodyText1);
  }
  TextStyle get bodyText2 {
    return colorToTextStyle(Get.textTheme.bodyText2);
  }
  TextStyle get caption {
    return colorToTextStyle(Get.textTheme.caption);
  }
  TextStyle get button {
    return colorToTextStyle(Get.textTheme.button);
  }
  TextStyle get overline {
    return colorToTextStyle(Get.textTheme.overline);
  }

  TextStyle colorToTextStyle(TextStyle? textStyle) {
    final int textStyleAlpha;
    if(this.alpha == 0xFF) {
      textStyleAlpha = textStyle?.color?.alpha ?? this.alpha;
    } else {
      textStyleAlpha = this.alpha;
    }

    return textStyle?.apply(color: this.withAlpha(textStyleAlpha)) ?? TextStyle(color: this);
  }
}