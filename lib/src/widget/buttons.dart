import 'package:widgets_by_zpdl/material.dart';

class AppButton extends ButtonByZpdL {
  const AppButton({
    Key? key,
    required Widget child,
    GestureTapCallback? onTap,
    Color color = Colors.transparent,
    ShapeBorder? shape,
    double disabledOpacity = 0.5,
    double elevation = 3.0,
    Duration duration = const Duration(milliseconds: 300),
  }) : super(
            child: child,
            onTap: onTap,
            color: color,
            shape: shape,
            disabledOpacity: disabledOpacity,
            elevation: elevation,
            duration: duration);
}
