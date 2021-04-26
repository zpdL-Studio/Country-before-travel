import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../responsive_config.dart';

typedef ResponsiveAppbarBuilder = PreferredSizeWidget Function(BuildContext context, ResponsiveDevice device, bool visibleDrawerMenu);
typedef ResponsiveDrawerBuilder = Widget Function(BuildContext context, ResponsiveDevice device);
typedef ResponsiveBodyBuilder = Widget Function(BuildContext context, ResponsiveDevice device, bool visibleDrawerMenu, bool visibleSubMenu);
typedef ResponsiveSubBuilder = Widget Function(BuildContext context, ResponsiveDevice device);

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

DrawerState responsiveDeviceToDrawerState(ResponsiveDevice device) {
  switch(device) {
    case ResponsiveDevice.MOBILE:
      return DrawerState.MENU;
    case ResponsiveDevice.TABLET:
    case ResponsiveDevice.DESKTOP:
      return DrawerState.DRAWER;
  }
}

enum SubState {
  MENU,
  MENU_TO_SUB,
  SUB,
  SUB_TO_MENU,
}

SubState responsiveDeviceToSubState(ResponsiveDevice device) {
  switch (device) {
    case ResponsiveDevice.MOBILE:
      return SubState.MENU;
    case ResponsiveDevice.TABLET:
    case ResponsiveDevice.DESKTOP:
      return SubState.SUB;
  }
}

class ResponsiveDrawerParameter {
  final ResponsiveDrawerBuilder builder;
  final DrawerCallback? onDrawerChanged;
  final Widget? endDrawer;
  final DrawerCallback? onEndDrawerChanged;
  final Color? drawerScrimColor;
  final double? drawerEdgeDragWidth;
  final bool? drawerEnableOpenDragGesture;
  final bool? endDrawerEnableOpenDragGesture;
  final DragStartBehavior? drawerDragStartBehavior;

  ResponsiveDrawerParameter({
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
}

class ResponsiveScaffoldParameter {

  const ResponsiveScaffoldParameter({
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

  Scaffold build({PreferredSizeWidget? appBar, Widget? body, Widget? drawer, ResponsiveDrawerParameter? responsiveDrawer}) {
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

