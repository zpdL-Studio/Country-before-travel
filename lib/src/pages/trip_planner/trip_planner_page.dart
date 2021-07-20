
import 'package:country_before_travel/res/values.dart' as R; // ignore: library_prefixes, prefer_relative_imports
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_by_zpdl/material.dart';

import '../../widget/async_worker.dart';
import 'trip_planner_controller.dart';

class TripPlannerPage extends AsyncWorkerBuilder<TripPlannerController> {

  static const double hPadding = 16;
  static const double vPadding = 12;

  @override
  Widget asyncWorkerBuilder(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [_buildAppbar(context, Get.width)];
          },
          body: PageView.builder(
            controller: controller.pageController,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: R.color.accentColor,
              );
            },
            itemCount: 1,
            // onPageChanged: onPageChanged,
          )),
    );
  }

  SliverAppBar _buildAppbar(BuildContext context, double width) {
    return SliverAppBar(
      pinned: true,
      collapsedHeight: kToolbarHeight,
      toolbarHeight: kToolbarHeight,
      expandedHeight: width * (1080.0 / 1920.0),
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        title: _buildAppbarTitle('1 일차'),
        titlePadding: const EdgeInsetsOnly(all: 16.0),
        background: Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  R.color.black,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
          child: R.images.fog_6126432_1920.widget(fit: BoxFit.cover),
        ),
        collapseMode: CollapseMode.parallax,
        stretchModes: [StretchMode.zoomBackground],
      ),
      backgroundColor: R.theme.primaryColor,
      actions: [
        IconButton(
            icon: Icon(
              Icons.menu,
              color: R.color.backgroundColor,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            }),
      ]);
  }

  Widget _buildAppbarTitle(String title) {
    return LayoutBuilder(builder: (context, constraint) {
      final appbar = context.findAncestorWidgetOfExactType<SliverAppBar>();
      final collapsedHeight = appbar?.collapsedHeight;
      final expandedHeight = appbar?.expandedHeight;
      var ratio = 0.0;
      if(collapsedHeight != null && expandedHeight != null) {
        final range = expandedHeight - collapsedHeight;
        ratio = (constraint.maxHeight - collapsedHeight) / range;
        if(ratio < 0) {
          ratio = 0;
        } else if(ratio > 1) {
          ratio = 1;
        }
      }

      return Row(
        children: [
          Spacer(flex: (ratio * 100).toInt() + 1,),
          Text(title),
          Spacer(flex: 1,),
        ],
      );
    });
  }
}