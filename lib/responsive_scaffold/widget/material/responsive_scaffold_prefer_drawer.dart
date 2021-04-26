import 'package:flutter/material.dart';

import '../../responsive_config.dart';
import '../responsive_layout.dart';
import 'responsive_parameter.dart';

class ResponsiveScaffoldPreferDrawer extends StatefulWidget {

  const ResponsiveScaffoldPreferDrawer({
    Key? key,
    required this.drawer,
    this.appBarBuilder,
    this.bodyBuilder,
    required this.subBuilder,
    this.parameter = const ResponsiveScaffoldParameter(),
  }) : super(key: key);

  final ResponsiveDrawerParameter drawer;
  final ResponsiveAppbarBuilder? appBarBuilder;
  final ResponsiveBodyBuilder? bodyBuilder;
  final ResponsiveSubBuilder subBuilder;
  final ResponsiveScaffoldParameter parameter;

  @override
  _ResponsiveScaffoldPreferDrawerState createState() => _ResponsiveScaffoldPreferDrawerState();
}

class _ResponsiveScaffoldPreferDrawerState extends State<ResponsiveScaffoldPreferDrawer> with TickerProviderStateMixin {

  DrawerState? _drawerState;
  late final AnimationController _drawerController;
  late final Animation<double> _drawerAnimation;

  SubState? _subState;
  late final AnimationController _subController;
  late final Animation<double> _subAnimation;

  @override
  void initState() {
    super.initState();
    final duration = const Duration(milliseconds: 500);

    _drawerController = AnimationController(vsync: this, duration: duration);
    _drawerAnimation = CurvedAnimation(parent: _drawerController, curve: Curves.easeOut);

    _subController = AnimationController(vsync: this, duration: duration);
    _subAnimation = CurvedAnimation(parent: _drawerController, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    super.dispose();
    _drawerAnimation.removeListener(_animate);
    _drawerController.dispose();

    _subAnimation.removeListener(_animate);
    _subController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      builder: (BuildContext context, ResponsiveDevice device, BoxConstraints constraints) {
        DrawerState drawerState = responsiveDeviceToDrawerState(device);
        switch(this._drawerState) {
          case null:
            this._drawerState = drawerState;
            switch(drawerState) {
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
            _drawerAnimation.addListener(_animate);
            break;
          case DrawerState.MENU:
            if(drawerState == DrawerState.DRAWER) {
              this._drawerState = DrawerState.MENU_TO_DRAWER;

              _drawerController.forward();
            }
            break;
          case DrawerState.MENU_TO_DRAWER:
            if(drawerState == DrawerState.MENU) {
              this._drawerState = DrawerState.DRAWER_TO_MENU;
              _drawerController.reverse();
            } else if(!_drawerController.isAnimating) {
              this._drawerState = DrawerState.DRAWER;
            }
            break;
          case DrawerState.DRAWER:
            if(drawerState == DrawerState.MENU) {
              this._drawerState = DrawerState.DRAWER_TO_MENU;
              _drawerController.reverse();
            }
            break;
          case DrawerState.DRAWER_TO_MENU:
            if(drawerState == DrawerState.DRAWER) {
              this._drawerState = DrawerState.MENU_TO_DRAWER;
              _drawerController.forward();
            } else if(!_drawerController.isAnimating) {
              this._drawerState = DrawerState.MENU;
            }
            break;
        }

        final SubState subStatus = responsiveDeviceToSubState(device);
        switch(this._subState) {
          case null:
            this._subState = subStatus;
            switch(subStatus) {
              case SubState.MENU:
                this._subController.value = 0.0;
                break;
              case SubState.SUB:
                this._subController.value = 1.0;
                break;
              case SubState.MENU_TO_SUB:
              case SubState.SUB_TO_MENU:
                break;
            }
            _subAnimation.addListener(_animate);
            break;
          case SubState.MENU:
            if(subStatus == SubState.SUB) {
              this._subState = SubState.MENU_TO_SUB;
              _subController.forward();
            }
            break;
          case SubState.MENU_TO_SUB:
            if(subStatus == SubState.MENU) {
              this._subState = SubState.SUB_TO_MENU;
              _subController.reverse();
            } else if(!_subController.isAnimating) {
              this._subState = SubState.SUB;
            }
            break;
          case SubState.SUB:
            if(subStatus == SubState.MENU) {
              this._subState = SubState.SUB_TO_MENU;
              _subController.reverse();
            }
            break;
          case SubState.SUB_TO_MENU:
            if(subStatus == SubState.SUB) {
              this._subState = SubState.MENU_TO_SUB;
              _subController.forward();
            } else if(!_subController.isAnimating) {
              this._subState = SubState.MENU;
            }
            break;
        }

        switch(this._drawerState!) {
          case DrawerState.MENU:
            switch(this._subState!) {
              case SubState.MENU:
                return _buildOnlyMenu(context, device, widget.appBarBuilder, widget.bodyBuilder);
              case SubState.MENU_TO_SUB:
              case SubState.SUB:
              case SubState.SUB_TO_MENU:
                return _buildTheSub(context, device, widget.appBarBuilder, widget.bodyBuilder, widget.subBuilder, constraints);
            }
          case DrawerState.MENU_TO_DRAWER:
          case DrawerState.DRAWER:
          case DrawerState.DRAWER_TO_MENU:
          switch(this._subState!) {
            case SubState.MENU:
              return _buildOnlyMenu(context, device, widget.appBarBuilder, widget.bodyBuilder);
            case SubState.MENU_TO_SUB:
            case SubState.SUB:
            case SubState.SUB_TO_MENU:
              return _buildTheSub(context, device, widget.appBarBuilder, widget.bodyBuilder, widget.subBuilder, constraints);
          }
        }
      },
    );
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

  SubState responsiveDeviceToSubState(ResponsiveDevice device) {
    switch (device) {
      case ResponsiveDevice.MOBILE:
      case ResponsiveDevice.TABLET:
        return SubState.MENU;
      case ResponsiveDevice.DESKTOP:
        return SubState.SUB;
    }
  }

  Widget _buildOnlyMenu(
      BuildContext context,
      ResponsiveDevice device,
      ResponsiveAppbarBuilder? appBarBuilder,
      ResponsiveBodyBuilder? bodyBuilder) {
    final appBarBuilder = this.widget.appBarBuilder;
    final bodyBuilder = this.widget.bodyBuilder;

    return widget.parameter.build(
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

  void _animate() {
    if(mounted) {
      setState(() {
      });
    }
  }

  Widget _buildTheDrawerAndSubMenu(
      BuildContext context,
      ResponsiveDevice device,
      ResponsiveAppbarBuilder? appBarBuilder,
      ResponsiveBodyBuilder? bodyBuilder,
      ResponsiveDrawerParameter drawer,
      BoxConstraints constraints
      ) {
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

  Widget _buildTheSub(
      BuildContext context,
      ResponsiveDevice device,
      ResponsiveAppbarBuilder? appBarBuilder,
      ResponsiveBodyBuilder? bodyBuilder,
      ResponsiveSubBuilder subBuilder,
      BoxConstraints constraints) {
    final PreferredSizeWidget? appBar = appBarBuilder != null ? appBarBuilder(context, device, false) : null;
    final double height = constraints.maxHeight - (appBar?.preferredSize.height ?? 0);
    double subWidth = ResponsiveConfig().getSubWidth(constraints.maxWidth);

    double animationX = subWidth * _subAnimation.value - subWidth;
    double drawerAnimationOpacity = _subAnimation.value > 0.25 ? 1.0 : _subAnimation.value * 4;

    return widget.parameter.build(
      appBar: appBar,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
              right: animationX + subWidth,
              child: bodyBuilder != null
                  ? bodyBuilder(context, device, false, false)
                  : Container()),
          Positioned(
            right: animationX,
            width: subWidth,
            height: height,
            child: Opacity(
                opacity: drawerAnimationOpacity,
                child: subBuilder(context, device)),
          )
        ],
      ),
    );
  }
}
