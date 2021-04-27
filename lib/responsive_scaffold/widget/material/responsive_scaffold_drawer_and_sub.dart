import 'package:flutter/material.dart';

import '../../responsive_config.dart';
import '../responsive_layout.dart';
import 'responsive_builder.dart';

class ResponsiveScaffoldDrawAndSub extends StatefulWidget {

  const ResponsiveScaffoldDrawAndSub({
    Key? key,
    required this.drawerBuilder,
    this.appBarBuilder,
    this.bodyBuilder,
    required this.subBuilder,
    this.builder = const ResponsiveScaffoldBuilder(),
    this.prefer = ResponsiveScaffoldPrefer.DRAWER,
  }) : super(key: key);

  final ResponsiveDrawerBuilder drawerBuilder;
  final ResponsiveAppbarBuilderCallback? appBarBuilder;
  final ResponsiveBodyBuilderCallback? bodyBuilder;
  final ResponsiveSubBuilderCallback subBuilder;
  final ResponsiveScaffoldBuilder builder;
  final ResponsiveScaffoldPrefer prefer;

  @override
  _ResponsiveScaffoldDrawAndSubState createState() => _ResponsiveScaffoldDrawAndSubState();

  DrawerState deviceToDrawerState(ResponsiveDevice device) {
    switch(prefer) {
      case ResponsiveScaffoldPrefer.DRAWER:
        switch(device) {
          case ResponsiveDevice.MOBILE:
            return DrawerState.MENU;
          case ResponsiveDevice.TABLET:
          case ResponsiveDevice.DESKTOP:
            return DrawerState.DRAWER;
        }
      case ResponsiveScaffoldPrefer.SUB:
        switch(device) {
          case ResponsiveDevice.MOBILE:
          case ResponsiveDevice.TABLET:
            return DrawerState.MENU;
          case ResponsiveDevice.DESKTOP:
            return DrawerState.DRAWER;
        }
    }
  }

  SubState deviceToSubState(ResponsiveDevice device) {
    switch(prefer) {
      case ResponsiveScaffoldPrefer.DRAWER:
        switch (device) {
          case ResponsiveDevice.MOBILE:
          case ResponsiveDevice.TABLET:
            return SubState.MENU;
          case ResponsiveDevice.DESKTOP:
            return SubState.SUB;
        }
      case ResponsiveScaffoldPrefer.SUB:
        switch (device) {
          case ResponsiveDevice.MOBILE:
            return SubState.MENU;
          case ResponsiveDevice.TABLET:
          case ResponsiveDevice.DESKTOP:
            return SubState.SUB;
        }
    }
  }
}

class _ResponsiveScaffoldDrawAndSubState extends State<ResponsiveScaffoldDrawAndSub> with TickerProviderStateMixin {

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
    _subAnimation = CurvedAnimation(parent: _subController, curve: Curves.easeOut);
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
        DrawerState drawerState = widget.deviceToDrawerState(device);
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

        final SubState subStatus = widget.deviceToSubState(device);
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
                return buildDrawerMenu(
                  context,
                  device,
                  widget.builder,
                  widget.appBarBuilder,
                  widget.bodyBuilder,
                  widget.drawerBuilder,
                  visibleSubMenu: true
                );
              case SubState.MENU_TO_SUB:
              case SubState.SUB:
              case SubState.SUB_TO_MENU:
                return buildSubView(
                    context,
                    device,
                    widget.builder,
                    widget.appBarBuilder,
                    widget.bodyBuilder,
                    widget.subBuilder,
                    constraints,
                    _subAnimation.value,
                    drawerBuilder: widget.drawerBuilder,
                  );
            }
          case DrawerState.MENU_TO_DRAWER:
          case DrawerState.DRAWER:
          case DrawerState.DRAWER_TO_MENU:
            switch(this._subState!) {
              case SubState.MENU:
                return buildDrawerView(
                  context,
                  device,
                  widget.builder,
                  widget.appBarBuilder,
                  widget.bodyBuilder,
                  widget.drawerBuilder,
                  constraints,
                  _drawerAnimation.value,
                  visibleSubMenu: true,
                );
              case SubState.MENU_TO_SUB:
              case SubState.SUB:
              case SubState.SUB_TO_MENU:
              return buildDrawerViewAndSubView(
                  context,
                  device,
                  widget.builder,
                  widget.appBarBuilder,
                  widget.bodyBuilder,
                  widget.drawerBuilder,
                  widget.subBuilder,
                  constraints,
                  _drawerAnimation.value,
                  _subAnimation.value,
                );
            }
        }
      },
    );
  }

  void _animate() {
    if(mounted) {
      setState(() {
      });
    }
  }

  Widget buildDrawerViewAndSubView(
    BuildContext context,
    ResponsiveDevice device,
    ResponsiveScaffoldBuilder builder,
    ResponsiveAppbarBuilderCallback? appBarBuilder,
    ResponsiveBodyBuilderCallback? bodyBuilder,
    ResponsiveDrawerBuilder drawerBuilder,
    ResponsiveSubBuilderCallback subBuilder,
    BoxConstraints constraints,
    double drawerAnimation,
    double subAnimation,
  ) {
    final PreferredSizeWidget? appBar = appBarBuilder != null ? appBarBuilder(context, device, false) : null;
    final double height = constraints.maxHeight - (appBar?.preferredSize.height ?? 0);

    double drawerWidth = ResponsiveConfig().getDrawerWidth(constraints.maxWidth);
    double drawerAnimationX = drawerWidth * drawerAnimation - drawerWidth;
    double drawerAnimationOpacity = drawerAnimation > 0.25 ? 1.0 : drawerAnimation * 4;

    double subWidth = ResponsiveConfig().getSubWidth(constraints.maxWidth - drawerWidth);
    double subAnimationX = subWidth * subAnimation - subWidth;
    double subAnimationOpacity = subAnimation > 0.25 ? 1.0 : subAnimation * 4;

    return builder.build(
      appBar: appBar,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
              left: drawerAnimationX + drawerWidth,
              right: subAnimationX + subWidth,
              child: bodyBuilder != null
                  ? bodyBuilder(context, device, false, false)
                  : Container()),
          Positioned(
            left: drawerAnimationX,
            width: drawerWidth,
            height: height,
            child: Opacity(
                opacity: drawerAnimationOpacity,
                child: drawerBuilder.builder(context, device)),
          ),
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
      drawer: null,
      responsiveDrawer: drawerBuilder,
    );
  }
}
