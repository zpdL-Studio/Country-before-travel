import 'package:flutter/material.dart';

import '../../responsive_config.dart';
import '../responsive_layout.dart';
import 'responsive_parameter.dart';

class ResponsiveScaffoldSub extends StatefulWidget {

  const ResponsiveScaffoldSub({
    Key? key,
    this.appBarBuilder,
    this.bodyBuilder,
    required this.subBuilder,
    this.parameter = const ResponsiveScaffoldParameter(),
  }) : super(key: key);

  final ResponsiveAppbarBuilder? appBarBuilder;
  final ResponsiveBodyBuilder? bodyBuilder;
  final ResponsiveSubBuilder subBuilder;
  final ResponsiveScaffoldParameter parameter;

  @override
  _ResponsiveScaffoldSubState createState() => _ResponsiveScaffoldSubState();
}

class _ResponsiveScaffoldSubState extends State<ResponsiveScaffoldSub> with SingleTickerProviderStateMixin {

  SubState? _subState;

  late final AnimationController _subController;
  late final Animation<double> _subAnimation;

  @override
  void initState() {
    super.initState();
    _subController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _subAnimation = CurvedAnimation(parent: _subController, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    super.dispose();
    _subAnimation.removeListener(_subAnimate);
    _subController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      builder: (BuildContext context, ResponsiveDevice device, BoxConstraints constraints) {

        final SubState status = responsiveDeviceToSubState(device);
        switch(this._subState) {
          case null:
            this._subState = status;
            switch(status) {
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
            _subAnimation.addListener(_subAnimate);
            break;
          case SubState.MENU:
            if(status == SubState.SUB) {
              this._subState = SubState.MENU_TO_SUB;
              _subController.forward();
            }
            break;
          case SubState.MENU_TO_SUB:
            if(status == SubState.MENU) {
              this._subState = SubState.SUB_TO_MENU;
              _subController.reverse();
            } else if(!_subController.isAnimating) {
              this._subState = SubState.SUB;
            }
            break;
          case SubState.SUB:
            if(status == SubState.MENU) {
              this._subState = SubState.SUB_TO_MENU;
              _subController.reverse();
            }
            break;
          case SubState.SUB_TO_MENU:
            if(status == SubState.SUB) {
              this._subState = SubState.MENU_TO_SUB;
              _subController.forward();
            } else if(!_subController.isAnimating) {
              this._subState = SubState.MENU;
            }
            break;
        }

        switch(this._subState!) {
          case SubState.MENU:
            return _buildTheMenu(context, device, widget.appBarBuilder, widget.bodyBuilder);
          case SubState.MENU_TO_SUB:
          case SubState.SUB:
          case SubState.SUB_TO_MENU:
            return _buildTheSub(context, device, widget.appBarBuilder, widget.bodyBuilder, widget.subBuilder, constraints);
        }
      },
    );
  }

  Widget _buildTheMenu(
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

  void _subAnimate() {
    if(mounted) {
      setState(() {
      });
    }
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
