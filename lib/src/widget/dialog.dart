import 'package:widgets_by_zpdl/material.dart';

import 'glass_container.dart';

Future<dynamic> showGlassDialog({
  required BuildContext context,
  required WidgetBuilder builder,
}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (context) {
        return GestureDetector(
            child: GlassContainer(
                child: SafeArea(
          child: Center(
            child: builder(context),
          ),
        )));
      });
}
