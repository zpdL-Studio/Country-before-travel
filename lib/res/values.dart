import 'package:get/get.dart';
import 'package:widgets_by_zpdl/material.dart';

import 'images.dart';

export 'colors.dart';
export 'images.dart';

extension ImagesWidget on images {
  Image widget({Key? key, double? size, double? width, double? height, BoxFit fit = BoxFit.fill}) {
    return Image.asset(
      name,
      width: size ?? width,
      height: size ?? height,
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

ElevationButton elevationIconButton(IconData icon,
    {Color? backgroundColor,
    Color? foregroundColor,
    double size = 24,
    ShapeBorder shape = const CircleBorder(),
    EdgeInsetsGeometry padding = const EdgeInsets.all(8.0),
    GestureTapCallback? onTap}) {
  return ElevationButton(
      color: backgroundColor ?? theme.backgroundColor,
      shape: shape,
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Icon(
          icon,
          color: foregroundColor ?? theme.primaryColor,
          size: 24,
        ),
      ));
}

abstract class shape {
  static ShapeBorder rect({double radius = 8, Color? color, double width = 1.0}) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: color != null
            ? BorderSide(color: color, width: width)
            : BorderSide.none);
  }

  static ShapeBorder circular({Color? color, double width = 1.0}) {
    return CircleBorder(
        side: color != null
            ? BorderSide(color: color, width: width)
            : BorderSide.none);
  }
}

double get hPadding => 16;