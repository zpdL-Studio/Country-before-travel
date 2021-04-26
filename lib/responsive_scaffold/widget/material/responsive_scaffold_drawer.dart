import 'package:flutter/material.dart';

import '../../responsive_config.dart';
import '../responsive_layout.dart';
import 'responsive_parameter.dart';

class ResponsiveScaffoldDrawer extends StatefulWidget {

  const ResponsiveScaffoldDrawer({
    Key? key,
    required this.drawer,
    this.appBarBuilder,
    this.bodyBuilder,
    this.parameter = const ResponsiveScaffoldParameter(),
  }) : super(key: key);

  final ResponsiveDrawerParameter drawer;
  final ResponsiveAppbarBuilder? appBarBuilder;
  final ResponsiveBodyBuilder? bodyBuilder;
  final ResponsiveScaffoldParameter parameter;

  @override
  _ResponsiveScaffoldDrawerState createState() => _ResponsiveScaffoldDrawerState();
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

        DrawerState status = responsiveDeviceToDrawerState(device);
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
            return _buildTheMenu(context, device, widget.appBarBuilder, widget.bodyBuilder, widget.drawer);
          case DrawerState.MENU_TO_DRAWER:
          case DrawerState.DRAWER:
          case DrawerState.DRAWER_TO_MENU:
            return _buildTheDrawer(context, device, widget.appBarBuilder, widget.bodyBuilder, widget.drawer, constraints);
        }
      },
    );
  }

  Widget _buildTheMenu(
      BuildContext context,
      ResponsiveDevice type,
      ResponsiveAppbarBuilder? appBarBuilder,
      ResponsiveBodyBuilder? bodyBuilder,
      ResponsiveDrawerParameter drawer) {
    final appBarBuilder = this.widget.appBarBuilder;
    final bodyBuilder = this.widget.bodyBuilder;

    return widget.parameter.build(
        appBar: appBarBuilder != null ? appBarBuilder(
            context,
            type,
            true) : null,
        body: Stack(
          children: [
            Positioned.fill(
                child: bodyBuilder != null
                    ? bodyBuilder(context, type, true, false)
                    : Container()),
          ],
        ),
        drawer: drawer.builder(context, type),
        responsiveDrawer: drawer
    );
  }

  void _drawerAnimate() {
    if(mounted) {
      setState(() {
      });
    }
  }

  Widget _buildTheDrawer(
      BuildContext context,
      ResponsiveDevice device,
      ResponsiveAppbarBuilder? appBarBuilder,
      ResponsiveBodyBuilder? bodyBuilder,
      ResponsiveDrawerParameter drawer,
      BoxConstraints constraints) {
    final PreferredSizeWidget? appBar = appBarBuilder != null ? appBarBuilder(context, device, false) : null;
    final double height = constraints.maxHeight - (appBar?.preferredSize.height ?? 0);
    double drawerWidth = ResponsiveConfig().getDrawerWidth(constraints.maxWidth);

    double drawerAnimationX = drawerWidth * _drawerAnimation.value - drawerWidth;
    double drawerAnimationOpacity = _drawerAnimation.value > 0.25 ? 1.0 : _drawerAnimation.value * 4;
    return widget.parameter.build(
      appBar: appBar,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
              left: drawerAnimationX + drawerWidth,
              child: bodyBuilder != null
                  ? bodyBuilder(context, device, false, false)
                  : Container()),
          Positioned(
            left: drawerAnimationX,
            width: drawerWidth,
            height: height,
            child: Opacity(
                opacity: drawerAnimationOpacity,
                child: drawer.builder(context, device)),
          )
        ],
      ),
      drawer: null,
      responsiveDrawer: drawer,
    );
  }
}
