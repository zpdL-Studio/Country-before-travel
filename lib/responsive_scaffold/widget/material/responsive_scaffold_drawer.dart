import 'package:flutter/material.dart';

import '../../responsive_config.dart';
import '../responsive_layout.dart';
import 'responsive_builder.dart';

class ResponsiveScaffoldDrawer extends StatefulWidget {

  const ResponsiveScaffoldDrawer({
    Key? key,
    required this.drawerBuilder,
    this.appBarBuilder,
    this.bodyBuilder,
    this.builder = const ResponsiveScaffoldBuilder(),
  }) : super(key: key);

  final ResponsiveDrawerBuilder drawerBuilder;
  final ResponsiveAppbarBuilderCallback? appBarBuilder;
  final ResponsiveBodyBuilderCallback? bodyBuilder;
  final ResponsiveScaffoldBuilder builder;

  @override
  _ResponsiveScaffoldDrawerState createState() => _ResponsiveScaffoldDrawerState();

  DrawerState deviceToDrawerState(ResponsiveDevice device) {
    switch (device) {
      case ResponsiveDevice.MOBILE:
        return DrawerState.MENU;
      case ResponsiveDevice.TABLET:
      case ResponsiveDevice.DESKTOP:
        return DrawerState.DRAWER;
    }
  }
}

class _ResponsiveScaffoldDrawerState extends State<ResponsiveScaffoldDrawer> with SingleTickerProviderStateMixin {

  DrawerState? _drawerState;

  late final AnimationController _drawerController;
  late final Animation<double> _drawerAnimation;

  @override
  void initState() {
    super.initState();
    _drawerController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _drawerAnimation = CurvedAnimation(parent: _drawerController, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    super.dispose();
    _drawerAnimation.removeListener(_drawerAnimate);
    _drawerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      builder: (BuildContext context, ResponsiveDevice device, BoxConstraints constraints) {
        DrawerState status = widget.deviceToDrawerState(device);
        switch(this._drawerState) {
          case null:
            this._drawerState = status;
            switch(status) {
              case DrawerState.MENU:
                this._drawerController.value = 0.0;
                break;
              case DrawerState.DRAWER:
                this._drawerController.value = 1.0;
                break;
              case DrawerState.MENU_TO_DRAWER:
              case DrawerState.DRAWER_TO_MENU:
                break;
            }
            _drawerAnimation.addListener(_drawerAnimate);
            break;
          case DrawerState.MENU:
            if(status == DrawerState.DRAWER) {
              this._drawerState = DrawerState.MENU_TO_DRAWER;

              _drawerController.forward();
            }
            break;
          case DrawerState.MENU_TO_DRAWER:
            if(status == DrawerState.MENU) {
              this._drawerState = DrawerState.DRAWER_TO_MENU;
              _drawerController.reverse();
            } else if(!_drawerController.isAnimating) {
              this._drawerState = DrawerState.DRAWER;
            }
            break;
          case DrawerState.DRAWER:
            if(status == DrawerState.MENU) {
              this._drawerState = DrawerState.DRAWER_TO_MENU;
              _drawerController.reverse();
            }
            break;
          case DrawerState.DRAWER_TO_MENU:
            if(status == DrawerState.DRAWER) {
              this._drawerState = DrawerState.MENU_TO_DRAWER;
              _drawerController.forward();
            } else if(!_drawerController.isAnimating) {
              this._drawerState = DrawerState.MENU;
            }
            break;
        }

        switch(this._drawerState!) {
          case DrawerState.MENU:
            return buildDrawerMenu(
              context,
              device,
              widget.builder,
              widget.appBarBuilder,
              widget.bodyBuilder,
              widget.drawerBuilder,
            );
          case DrawerState.MENU_TO_DRAWER:
          case DrawerState.DRAWER:
          case DrawerState.DRAWER_TO_MENU:
            return buildDrawerView(
                context,
                device,
                widget.builder,
                widget.appBarBuilder,
                widget.bodyBuilder,
                widget.drawerBuilder,
                constraints,
                _drawerAnimation.value,
              );
        }
      },
    );
  }
  
  void _drawerAnimate() {
    if(mounted) {
      setState(() {
      });
    }
  }
}
