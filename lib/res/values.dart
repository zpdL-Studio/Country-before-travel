export 'colors.dart';
export 'images.dart';

import 'package:flutter/material.dart';

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

EdgeInsetsGeometry edgeInsets({double? all, double? vertical, double? horizontal, double? start, double? top, double? end, double? bottom}) =>
    EdgeInsetsDirectional.only(
      start: _edgeInsets(start, horizontal, all),
      end: _edgeInsets(end, horizontal, all),
      top: _edgeInsets(top, vertical, all),
      bottom: _edgeInsets(bottom, vertical, all),
    );

double _edgeInsets(double? only, double? symmetric, double? all) {
  if(only != null) {
    return only;
  } else if(symmetric != null) {
    return symmetric;
  } else if(all != null) {
    return all;
  } else {
    return 0;
  }
}