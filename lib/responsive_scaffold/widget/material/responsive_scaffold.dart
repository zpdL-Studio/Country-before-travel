import 'package:flutter/material.dart';

import '../../responsive_config.dart';
import '../responsive_layout.dart';
import 'responsive_parameter.dart';
import 'responsive_scaffold_drawer.dart';
import 'responsive_scaffold_sub.dart';

class ResponsiveScaffold extends StatelessWidget {

  const ResponsiveScaffold({
    Key? key,
    this.drawer,
    this.appBarBuilder,
    this.bodyBuilder,
    this.subBuilder,
    this.parameter = const ResponsiveScaffoldParameter(),
    this.prefer = ResponsiveScaffoldPrefer.DRAWER,
  }) : super(key: key);

  final ResponsiveDrawerParameter? drawer;
  final ResponsiveAppbarBuilder? appBarBuilder;
  final ResponsiveBodyBuilder? bodyBuilder;
  final ResponsiveSubBuilder? subBuilder;
  final ResponsiveScaffoldParameter parameter;
  final ResponsiveScaffoldPrefer prefer;

  @override
  Widget build(BuildContext context) {
    final drawer = this.drawer;
    final subBuilder = this.subBuilder;

    if(drawer != null && subBuilder != null) {
      return ResponsiveScaffoldDrawer(
        drawer: drawer,
        appBarBuilder: appBarBuilder,
        bodyBuilder: bodyBuilder,
        parameter: parameter,
      );
    } else if(drawer != null) {
      return ResponsiveScaffoldDrawer(
        drawer: drawer,
        appBarBuilder: appBarBuilder,
        bodyBuilder: bodyBuilder,
        parameter: parameter,
      );
    } else if(subBuilder != null) {
      return ResponsiveScaffoldSub(
        appBarBuilder: appBarBuilder,
        bodyBuilder: bodyBuilder,
        subBuilder: subBuilder,
        parameter: parameter,
      );
    }

    return ResponsiveLayoutBuilder(builder: (BuildContext context, ResponsiveDevice device, BoxConstraints constraints) {
      return _build(context, device, appBarBuilder, bodyBuilder);
    });
  }

  Widget _build(BuildContext context,
      ResponsiveDevice device,
      ResponsiveAppbarBuilder? appBarBuilder,
      ResponsiveBodyBuilder? bodyBuilder) {
    return parameter.build(
        appBar: appBarBuilder != null ? appBarBuilder(
            context,
            device,
            false) : null,
        body: bodyBuilder != null
            ? bodyBuilder(context, device, false, false)
            : Container()
    );
  }
}

// class ResponsiveScaffold extends StatefulWidget {
//
//   const ResponsiveScaffold({
//     Key? key,
//     this.drawer,
//     this.appBarBuilder,
//     this.bodyBuilder,
//     this.subBuilder,
//     this.parameter,
//     this.priority = ResponsiveScaffoldPriority.DRAWER,
//   }) : super(key: key);
//
//   final ResponsiveDrawerParameter? drawer;
//   final ResponsiveAppbarBuilder? appBarBuilder;
//   final ResponsiveBodyBuilder? bodyBuilder;
//   final ResponsiveSubBuilder? subBuilder;
//   final ResponsiveScaffoldParameter? parameter;
//   final ResponsiveScaffoldPriority priority;
//
//   @override
//   _ResponsiveScaffoldState createState() => _ResponsiveScaffoldState();
// }
//
// class _ResponsiveScaffoldState extends State<ResponsiveScaffold> with TickerProviderStateMixin {
//
//   _DrawerState? _drawerState;
//   late final AnimationController _drawerController;
//   late final Animation<double> _drawerAnimation;
//
//   _SubState? _subState;
//   late final AnimationController _subController;
//   late final Animation<double> _subAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     final duration = const Duration(milliseconds: 500);
//
//     _drawerController = AnimationController(vsync: this, duration: duration);
//     _drawerAnimation = CurvedAnimation(parent: _drawerController, curve: Curves.easeOut);
//
//     _subController = AnimationController(vsync: this, duration: duration);
//     _subAnimation = CurvedAnimation(parent: _drawerController, curve: Curves.easeOut);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _drawerAnimation.removeListener(_drawerAnimate);
//     _drawerController.dispose();
//
//     _subAnimation.removeListener(_drawerAnimate);
//     _subController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveLayoutBuilder(
//       builder: (BuildContext context, ResponsiveDevice device, BoxConstraints constraints) {
//
//         final drawer = this.widget.drawer;
//         final subBuilder = this.widget.subBuilder;
//         final priority = this.widget.priority;
//         final parameter = this.widget.parameter ?? ResponsiveScaffoldParameter();
//
//         if(drawer == null && subBuilder == null) {
//           return _buildWithout(context, device, parameter, widget.appBarBuilder, widget.bodyBuilder);
//         } else if(subBuilder != null) {
//           return _buildOnlySub(context, device, parameter, widget.appBarBuilder, widget.bodyBuilder, subBuilder);
//         }
//
//         _DrawerState drawerState = _responsiveDeviceToDrawerState(device);
//         switch(this._drawerState) {
//           case null:
//             this._drawerState = drawerState;
//             switch(drawerState) {
//               case _DrawerState.MENU:
//                 this._drawerController.value = 0.0;
//                 break;
//               case _DrawerState.DRAWER:
//                 this._drawerController.value = 1.0;
//                 break;
//               case _DrawerState.MENU_TO_DRAWER:
//               case _DrawerState.DRAWER_TO_MENU:
//                 break;
//             }
//             _drawerAnimation.addListener(_drawerAnimate);
//             break;
//           case _DrawerState.MENU:
//             if(drawerState == _DrawerState.DRAWER) {
//               this._drawerState = _DrawerState.MENU_TO_DRAWER;
//
//               _drawerController.forward();
//             }
//             break;
//           case _DrawerState.MENU_TO_DRAWER:
//             if(drawerState == _DrawerState.MENU) {
//               this._drawerState = _DrawerState.DRAWER_TO_MENU;
//               _drawerController.reverse();
//             } else if(!_drawerController.isAnimating) {
//               this._drawerState = _DrawerState.DRAWER;
//             }
//             break;
//           case _DrawerState.DRAWER:
//             if(drawerState == _DrawerState.MENU) {
//               this._drawerState = _DrawerState.DRAWER_TO_MENU;
//               _drawerController.reverse();
//             }
//             break;
//           case _DrawerState.DRAWER_TO_MENU:
//             if(drawerState == _DrawerState.DRAWER) {
//               this._drawerState = _DrawerState.MENU_TO_DRAWER;
//               _drawerController.forward();
//             } else if(!_drawerController.isAnimating) {
//               this._drawerState = _DrawerState.MENU;
//             }
//             break;
//         }
//
//
//         switch(this._drawerState!) {
//           case _DrawerState.MENU:
//             return _buildWithMenu(context, device, parameter, widget.appBarBuilder, widget.bodyBuilder, drawer);
//           case _DrawerState.MENU_TO_DRAWER:
//           case _DrawerState.DRAWER:
//           case _DrawerState.DRAWER_TO_MENU:
//             return _buildWithDrawer(context, device, parameter, widget.appBarBuilder, widget.bodyBuilder, drawer, constraints);
//         }
//       },
//     );
//   }
//
//   _DrawerState _responsiveDeviceToDrawerState(ResponsiveDevice device) {
//     switch(device) {
//       case ResponsiveDevice.MOBILE:
//         return _DrawerState.MENU;
//       case ResponsiveDevice.TABLET:
//       case ResponsiveDevice.DESKTOP:
//         return _DrawerState.DRAWER;
//     }
//   }
//
//   _SubState _responsiveDeviceToSubState(ResponsiveDevice device) {
//     switch(device) {
//       case ResponsiveDevice.MOBILE:
//       case ResponsiveDevice.TABLET:
//         return _SubState.MENU;
//       case ResponsiveDevice.DESKTOP:
//         return _SubState.SUB;
//     }
//   }
//
//   Widget _buildWithout(BuildContext context, ResponsiveDevice type,
//       ResponsiveScaffoldParameter parameter, ResponsiveAppbarBuilder? appBarBuilder,
//       ResponsiveBodyBuilder? bodyBuilder) {
//     return parameter.build(
//         appBar: appBarBuilder != null ? appBarBuilder(
//             context,
//             type,
//             false) : null,
//         body: bodyBuilder != null
//             ? bodyBuilder(context, type, false, false)
//             : Container()
//     );
//   }
//
//   Widget _buildOnlySub(BuildContext context, ResponsiveDevice type,
//       ResponsiveScaffoldParameter parameter, ResponsiveAppbarBuilder? appBarBuilder,
//       ResponsiveBodyBuilder? bodyBuilder, ResponsiveSubBuilder subBuilder) {
//     return Container();
//   }
//
//   Widget _buildWithMenu(BuildContext context, ResponsiveDevice type,
//       ResponsiveScaffoldParameter parameter, ResponsiveAppbarBuilder? appBarBuilder,
//       ResponsiveBodyBuilder? bodyBuilder, ResponsiveDrawerParameter drawer) {
//     final appBarBuilder = this.widget.appBarBuilder;
//     final bodyBuilder = this.widget.bodyBuilder;
//
//     return parameter.build(
//         appBar: appBarBuilder != null ? appBarBuilder(
//             context,
//             type,
//             true) : null,
//         body: Stack(
//           children: [
//             Positioned.fill(
//                 child: bodyBuilder != null
//                     ? bodyBuilder(context, type, true, false)
//                     : Container()),
//           ],
//         ),
//         drawer: drawer.builder(context, type),
//         responsiveDrawer: drawer
//     );
//   }
//
//   void _drawerAnimate() {
//     if(mounted) {
//       setState(() {});
//     }
//   }
//
//   Widget _buildWithDrawer(BuildContext context, ResponsiveDevice type,
//       ResponsiveScaffoldParameter parameter, ResponsiveAppbarBuilder? appBarBuilder,
//       ResponsiveBodyBuilder? bodyBuilder, ResponsiveDrawerParameter drawer,
//       BoxConstraints constraints) {
//
//     final PreferredSizeWidget? appBar = appBarBuilder != null ? appBarBuilder(context, type, false) : null;
//     final double height = constraints.maxHeight - (appBar?.preferredSize.height ?? 0);
//     double drawerWidth = ResponsiveConfig().getDrawerDrawerWidth(constraints.maxWidth);
//
//     double drawerAnimationX = drawerWidth * _drawerAnimation.value - drawerWidth;
//
//     double drawerAnimationOpacity = _drawerAnimation.value > 0.25 ? 1.0 : _drawerAnimation.value * 4;
//     return parameter.build(
//       appBar: appBar,
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Positioned.fill(
//               left: drawerAnimationX + drawerWidth,
//               child: bodyBuilder != null
//                   ? bodyBuilder(context, type, false, false)
//                   : Container()),
//           Positioned(
//             left: drawerAnimationX,
//             width: drawerWidth,
//             height: height,
//             child: Opacity(
//                 opacity: drawerAnimationOpacity,
//                 child: drawer.builder(context, type)),
//           )
//         ],
//       ),
//       drawer: null,
//       responsiveDrawer: drawer,
//     );
//   }
// }

