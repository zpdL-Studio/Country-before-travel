import 'package:flutter/widgets.dart';

import '../responsive_config.dart';

typedef ResponsiveLayoutWidgetBuilder = Widget Function(BuildContext context, ResponsiveDevice device, BoxConstraints constraints);

class ResponsiveLayoutBuilder extends StatelessWidget {

  final ResponsiveLayoutWidgetBuilder builder;

  const ResponsiveLayoutBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return builder(context, ResponsiveConfig().device(constraints.maxWidth), constraints);
      },
    );
  }
}

abstract class ResponsiveLayoutWidget extends StatelessWidget {

  const ResponsiveLayoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return buildLayout(context, ResponsiveConfig().device(constraints.maxWidth), constraints);
      },
    );
  }

  @protected
  Widget buildLayout(BuildContext context, ResponsiveDevice type, BoxConstraints constraints);
}