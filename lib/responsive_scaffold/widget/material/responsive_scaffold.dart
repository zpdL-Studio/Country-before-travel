import 'package:flutter/material.dart';

import '../../responsive_config.dart';
import '../responsive_layout.dart';
import 'responsive_builder.dart';
import 'responsive_scaffold_drawer.dart';
import 'responsive_scaffold_drawer_and_sub.dart';
import 'responsive_scaffold_sub.dart';

class ResponsiveScaffold extends StatelessWidget {

  const ResponsiveScaffold({
    Key? key,
    this.drawerBuilder,
    this.appBarBuilder,
    this.bodyBuilder,
    this.subBuilder,
    this.builder = const ResponsiveScaffoldBuilder(),
    this.prefer = ResponsiveScaffoldPrefer.DRAWER,
  }) : super(key: key);

  final ResponsiveDrawerBuilder? drawerBuilder;
  final ResponsiveAppbarBuilderCallback? appBarBuilder;
  final ResponsiveBodyBuilderCallback? bodyBuilder;
  final ResponsiveSubBuilderCallback? subBuilder;
  final ResponsiveScaffoldBuilder builder;
  final ResponsiveScaffoldPrefer prefer;

  @override
  Widget build(BuildContext context) {
    final drawerBuilder = this.drawerBuilder;
    final subBuilder = this.subBuilder;

    if(drawerBuilder != null && subBuilder != null) {
      return ResponsiveScaffoldDrawAndSub(
        drawerBuilder: drawerBuilder,
        appBarBuilder: appBarBuilder,
        bodyBuilder: bodyBuilder,
        subBuilder: subBuilder,
        builder: builder,
        prefer: prefer,
      );
    } else if(drawerBuilder != null) {
      return ResponsiveScaffoldDrawer(
        drawerBuilder: drawerBuilder,
        appBarBuilder: appBarBuilder,
        bodyBuilder: bodyBuilder,
        builder: builder,
      );
    } else if(subBuilder != null) {
      return ResponsiveScaffoldSub(
        appBarBuilder: appBarBuilder,
        bodyBuilder: bodyBuilder,
        subBuilder: subBuilder,
        builder: builder,
      );
    }

    return ResponsiveLayoutBuilder(builder: (BuildContext context, ResponsiveDevice device, BoxConstraints constraints) {
      return buildOnly(context, device, builder, appBarBuilder, bodyBuilder);
    });
  }
}
