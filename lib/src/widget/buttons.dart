import 'package:widgets_by_zpdl/material.dart';

class AppElevationButton extends ElevationButton {
  const AppElevationButton({
    Key? key,
    required Widget child,
    GestureTapCallback? onTap,
    Color? color,
    ShapeBorder? shape,
    double disabledOpacity = 0.5,
    double elevation = 5.0,
    Duration? duration,
  }) : super(
            child: child,
            onTap: onTap,
            color: color,
            shape: shape,
            disabledOpacity: disabledOpacity,
            elevation: elevation,
            duration: duration);
}

class AppScaleButton extends ScaleButton {
  const AppScaleButton({
    Key? key,
    required Widget child,
    GestureTapCallback? onTap,
    Color? color,
    ShapeBorder? shape,
    double disabledOpacity = 0.5,
    double pressScale = 0.85,
    Duration? duration,
  }) : super(
      child: child,
      onTap: onTap,
      color: color,
      shape: shape,
      disabledOpacity: disabledOpacity,
      pressScale: pressScale,
      duration: duration);
}
