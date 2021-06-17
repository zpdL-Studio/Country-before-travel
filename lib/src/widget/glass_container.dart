import 'dart:ui';

import 'package:widgets_by_zpdl/material.dart';

class GlassContainer extends StatelessWidget {

  final double sigmaX;
  final double sigmaY;
  final Color color;
  final double opacity;
  final ShapeBorder? shape;
  final Widget child;

  const GlassContainer(
      {Key? key,
      this.sigmaX = 4.0,
      this.sigmaY = 4.0,
      this.opacity = 0.1,
      this.color = Colors.white,
      this.shape,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      shape: shape,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY, tileMode: TileMode.mirror),
        child: Container(
          color: color.withOpacity(opacity),
          child: child
        ),
      ),
    );
  }
}
