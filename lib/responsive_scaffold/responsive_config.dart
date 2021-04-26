import 'package:flutter/widgets.dart';

enum ResponsiveDevice {
  MOBILE,
  TABLET,
  DESKTOP,
}

class ResponsiveConfig {

  static final ResponsiveConfig _instance = ResponsiveConfig._();

  factory ResponsiveConfig() => _instance;

  ResponsiveConfig._();

  double _mobile = 650;
  double _tablet = 1100;

  double drawerMinWidth = 200;
  double drawerMaxWidth = 304;

  double drawerFlex = 4;
  double bodyFlex = 6;
  double bodyMainFlex = 1;
  double bodySubFlex = 1;
  
  double getDrawerWidth(double width) {
    final drawerWidth = drawerFlex / (drawerFlex + bodyFlex) * width;

    if(drawerWidth < drawerMinWidth) {
      return drawerMinWidth;
    } else if(drawerWidth > drawerMaxWidth) {
      return drawerMaxWidth;
    }
    return drawerWidth;
  }

  double getSubWidth(double width) {
    final subWidth = bodySubFlex / (bodyMainFlex + bodySubFlex) * width;
    final minWidth = bodySubFlex / (bodyMainFlex + bodySubFlex) * _mobile;
    if(subWidth < minWidth) {
      return minWidth;
    }
    return subWidth;
  }
}

extension ResponsiveConfigDevice on ResponsiveConfig {

  void setDeviceWidth(double mobile, tablet) {
    assert(mobile <= tablet);
    this._mobile = mobile;
    this._tablet = tablet;
  }

  bool isMobile(double width) => width < _mobile;

  bool isMobileOf(BuildContext context) => isMobile(MediaQuery.of(context).size.width);

  bool isTablet(double width) => width < _tablet && width >= _mobile;

  bool isTabletOf(BuildContext context) => isTablet(MediaQuery.of(context).size.width);

  bool isDesktop(double width) => width >= _tablet;

  bool isDesktopOf(BuildContext context) => isDesktop(MediaQuery.of(context).size.width);

  ResponsiveDevice deviceOf(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if(width < _mobile) {
      return ResponsiveDevice.MOBILE;
    } else if(width < _tablet) {
      return ResponsiveDevice.TABLET;
    } else {
      return ResponsiveDevice.DESKTOP;
    }
  }

  ResponsiveDevice device(double width) {
    if(width < _mobile) {
      return ResponsiveDevice.MOBILE;
    } else if(width < _tablet) {
      return ResponsiveDevice.TABLET;
    } else {
      return ResponsiveDevice.DESKTOP;
    }
  }
}