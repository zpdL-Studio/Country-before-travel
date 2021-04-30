import 'package:flutter/material.dart';

import '../../responsive_config.dart';
import '../responsive_layout.dart';
import 'responsive_builder.dart';

class ResponsiveScaffoldSub extends StatefulWidget {

  const ResponsiveScaffoldSub({
    Key? key,
    this.appBarBuilder,
    this.bodyBuilder,
    required this.subBuilder,
    this.builder = const ResponsiveScaffoldBuilder(),
  }) : super(key: key);

  final ResponsiveAppbarBuilderCallback? appBarBuilder;
  final ResponsiveBodyBuilderCallback? bodyBuilder;
  final ResponsiveSubBuilderCallback subBuilder;
  final ResponsiveScaffoldBuilder builder;

  @override
  _ResponsiveScaffoldSubState createState() => _ResponsiveScaffoldSubState();

  SubState deviceToSubState(ResponsiveDevice device) {
    switch (device) {
      case ResponsiveDevice.MOBILE:
        return SubState.MENU;
      case ResponsiveDevice.TABLET:
      case ResponsiveDevice.DESKTOP:
        return SubState.SUB;
    }
  }
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
        final SubState status = widget.deviceToSubState(device);
        switch(_subState) {
          case null:
            _subState = status;
            switch(status) {
              case SubState.MENU:
                _subController.value = 0.0;
                break;
              case SubState.SUB:
                _subController.value = 1.0;
                break;
              case SubState.MENU_TO_SUB:
              case SubState.SUB_TO_MENU:
                break;
            }
            _subAnimation.addListener(_subAnimate);
            break;
          case SubState.MENU:
            if(status == SubState.SUB) {
              _subState = SubState.MENU_TO_SUB;
              _subController.forward();
            }
            break;
          case SubState.MENU_TO_SUB:
            if(status == SubState.MENU) {
              _subState = SubState.SUB_TO_MENU;
              _subController.reverse();
            } else if(!_subController.isAnimating) {
              _subState = SubState.SUB;
            }
            break;
          case SubState.SUB:
            if(status == SubState.MENU) {
              _subState = SubState.SUB_TO_MENU;
              _subController.reverse();
            }
            break;
          case SubState.SUB_TO_MENU:
            if(status == SubState.SUB) {
              _subState = SubState.MENU_TO_SUB;
              _subController.forward();
            } else if(!_subController.isAnimating) {
              _subState = SubState.MENU;
            }
            break;
        }

        switch(_subState!) {
          case SubState.MENU:
            return buildSubMenu(
              context,
              device,
              widget.builder,
              widget.appBarBuilder,
              widget.bodyBuilder,
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
              );
        }
      },
    );
  }

  void _subAnimate() {
    if(mounted) {
      setState(() {
      });
    }
  }
}
