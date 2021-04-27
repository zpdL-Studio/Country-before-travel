import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../responsive_config.dart';

typedef ResponsiveAppbarBuilderCallback = PreferredSizeWidget Function(BuildContext context, ResponsiveDevice device, bool visibleDrawerMenu);
typedef ResponsiveDrawerBuilderCallback = Widget Function(BuildContext context, ResponsiveDevice device);
typedef ResponsiveBodyBuilderCallback = Widget Function(BuildContext context, ResponsiveDevice device, bool visibleDrawerMenu, bool visibleSubMenu);
typedef ResponsiveSubBuilderCallback = Widget Function(BuildContext context, ResponsiveDevice device);

enum ResponsiveScaffoldPrefer {
  DRAWER,
  SUB
}

enum DrawerState {
  MENU,
  MENU_TO_DRAWER,
  DRAWER,
  DRAWER_TO_MENU,
}

enum SubState {
  MENU,
  MENU_TO_SUB,
  SUB,
  SUB_TO_MENU,
}

class ResponsiveDrawerBuilder {
  final ResponsiveDrawerBuilderCallback builder;
  final DrawerCallback? onDrawerChanged;
  final Widget? endDrawer;
  final DrawerCallback? onEndDrawerChanged;
  final Color? drawerScrimColor;
  final double? drawerEdgeDragWidth;
  final bool? drawerEnableOpenDragGesture;
  final bool? endDrawerEnableOpenDragGesture;
  final DragStartBehavior? drawerDragStartBehavior;

  ResponsiveDrawerBuilder({
    required this.builder,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
  });
  
  Widget build(BuildContext context, ResponsiveDevice device) => builder(context, device);
}

class ResponsiveScaffoldBuilder {

  const ResponsiveScaffoldBuilder({
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.restorationId,
  });

  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? persistentFooterButtons;

  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Color? backgroundColor;

  final bool? resizeToAvoidBottomInset;
  final bool primary;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final String? restorationId;

  Scaffold build({PreferredSizeWidget? appBar, Widget? body, Widget? drawer, ResponsiveDrawerBuilder? responsiveDrawer}) {
    return Scaffold(
      appBar: appBar,
      body: body,
      drawer: drawer,
      onDrawerChanged: responsiveDrawer?.onDrawerChanged,
      endDrawer: responsiveDrawer?.endDrawer,
      onEndDrawerChanged: responsiveDrawer?.onEndDrawerChanged,
      drawerScrimColor: responsiveDrawer?.drawerScrimColor,
      drawerEdgeDragWidth: responsiveDrawer?.drawerEdgeDragWidth,
      drawerEnableOpenDragGesture: responsiveDrawer?.drawerEnableOpenDragGesture ?? true,
      endDrawerEnableOpenDragGesture: responsiveDrawer?.endDrawerEnableOpenDragGesture ?? true,
      drawerDragStartBehavior: responsiveDrawer?.drawerDragStartBehavior ?? DragStartBehavior.start,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      persistentFooterButtons: persistentFooterButtons,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      primary: primary,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      restorationId: restorationId,
    );
  }
}

Widget buildOnly(BuildContext context,
    ResponsiveDevice device,
    ResponsiveScaffoldBuilder builder,
    ResponsiveAppbarBuilderCallback? appBarBuilder,
    ResponsiveBodyBuilderCallback? bodyBuilder) {
  return builder.build(
      appBar: appBarBuilder != null ? appBarBuilder(
          context,
          device,
          false) : null,
      body: bodyBuilder != null
          ? bodyBuilder(context, device, false, false)
          : Container()
  );
}

Widget buildDrawerMenu(
  BuildContext context,
  ResponsiveDevice device,
  ResponsiveScaffoldBuilder builder,
  ResponsiveAppbarBuilderCallback? appBarBuilder,
  ResponsiveBodyBuilderCallback? bodyBuilder,
  ResponsiveDrawerBuilder drawerBuilder, {
  bool visibleSubMenu = false,
}) {
  return builder.build(
      appBar: appBarBuilder != null ? appBarBuilder(
          context,
          device,
          true) : null,
      body: Stack(
        children: [
          Positioned.fill(
              child: bodyBuilder != null
                  ? bodyBuilder(context, device, true, visibleSubMenu)
                  : Container()),
        ],
      ),
      drawer: drawerBuilder.builder(context, device),
      responsiveDrawer: drawerBuilder
  );
}

Widget buildDrawerView(
  BuildContext context,
  ResponsiveDevice device,
  ResponsiveScaffoldBuilder builder,
  ResponsiveAppbarBuilderCallback? appBarBuilder,
  ResponsiveBodyBuilderCallback? bodyBuilder,
  ResponsiveDrawerBuilder drawerBuilder,
  BoxConstraints constraints,
  double drawerAnimation, {
  bool visibleSubMenu = false,
}) {
  final PreferredSizeWidget? appBar = appBarBuilder != null ? appBarBuilder(context, device, false) : null;
  final double height = constraints.maxHeight - (appBar?.preferredSize.height ?? 0);
  double drawerWidth = ResponsiveConfig().getDrawerWidth(constraints.maxWidth);

  double drawerAnimationX = drawerWidth * drawerAnimation - drawerWidth;
  double drawerAnimationOpacity = drawerAnimation > 0.25 ? 1.0 : drawerAnimation * 4;
  return builder.build(
    appBar: appBar,
    body: Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
            left: drawerAnimationX + drawerWidth,
            child: bodyBuilder != null
                ? bodyBuilder(context, device, false, visibleSubMenu)
                : Container()),
        Positioned(
          left: drawerAnimationX,
          width: drawerWidth,
          height: height,
          child: Opacity(
              opacity: drawerAnimationOpacity,
              child: drawerBuilder.builder(context, device)),
        )
      ],
    ),
    drawer: null,
    responsiveDrawer: drawerBuilder,
  );
}

Widget buildSubMenu(
    BuildContext context,
    ResponsiveDevice device,
    ResponsiveScaffoldBuilder builder,
    ResponsiveAppbarBuilderCallback? appBarBuilder,
    ResponsiveBodyBuilderCallback? bodyBuilder) {

  return builder.build(
    appBar: appBarBuilder != null ? appBarBuilder(
        context,
        device,
        false) : null,
    body: Stack(
      children: [
        Positioned.fill(
            child: bodyBuilder != null
                ? bodyBuilder(context, device, false, true)
                : Container()),
      ],
    ),
  );
}

Widget buildSubView(
    BuildContext context,
    ResponsiveDevice device,
    ResponsiveScaffoldBuilder builder,
    ResponsiveAppbarBuilderCallback? appBarBuilder,
    ResponsiveBodyBuilderCallback? bodyBuilder,
    ResponsiveSubBuilderCallback subBuilder,
    BoxConstraints constraints,
    double subAnimation,
    {ResponsiveDrawerBuilder? drawerBuilder}) {
  final PreferredSizeWidget? appBar = appBarBuilder != null ? appBarBuilder(context, device, false) : null;
  final double height = constraints.maxHeight - (appBar?.preferredSize.height ?? 0);
  double subWidth = ResponsiveConfig().getSubWidth(constraints.maxWidth);

  double subAnimationX = subWidth * subAnimation - subWidth;
  double subAnimationOpacity = subAnimation > 0.25 ? 1.0 : subAnimation * 4;

  return builder.build(
    appBar: appBar,
    body: Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
            right: subAnimationX + subWidth,
            child: bodyBuilder != null
                ? bodyBuilder(context, device, drawerBuilder != null, false)
                : Container()),
        Positioned(
          right: subAnimationX,
          width: subWidth,
          height: height,
          child: Opacity(
              opacity: subAnimationOpacity,
              child: subBuilder(context, device)),
        )
      ],
    ),
    drawer: drawerBuilder?.builder(context, device),
    responsiveDrawer: drawerBuilder
  );
}