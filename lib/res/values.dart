export 'colors.dart';
export 'images.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'images.dart';

extension ImagesWidget on images {
  Image widget({Key? key, double? size, double? width, double? height, BoxFit fit = BoxFit.fill}) {
    return Image.asset(
      this.name,
      width: size != null ? size : width,
      height: size != null ? size : height,
      fit: fit,
    );
  }
}

ThemeData get theme => Get.theme;

TextStyle get headline1 => theme.textTheme.headline1 ?? TextStyle();
TextStyle get headline2 => theme.textTheme.headline2 ?? TextStyle();
TextStyle get headline3 => theme.textTheme.headline3 ?? TextStyle();
TextStyle get headline4 => theme.textTheme.headline4 ?? TextStyle();
TextStyle get headline5 => theme.textTheme.headline5 ?? TextStyle();
TextStyle get headline6 => theme.textTheme.headline6 ?? TextStyle();
TextStyle get subtitle1 => theme.textTheme.subtitle1 ?? TextStyle();
TextStyle get subtitle2 => theme.textTheme.subtitle2 ?? TextStyle();
TextStyle get bodyText1 => theme.textTheme.bodyText1 ?? TextStyle();
TextStyle get bodyText2 => theme.textTheme.bodyText2 ?? TextStyle();
TextStyle get caption => theme.textTheme.caption ?? TextStyle();
TextStyle get button => theme.textTheme.button ?? TextStyle();
TextStyle get overline => theme.textTheme.overline ?? TextStyle();
