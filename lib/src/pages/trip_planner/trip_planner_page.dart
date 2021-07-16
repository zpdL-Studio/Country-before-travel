
import 'package:country_before_travel/res/values.dart' as R; // ignore: library_prefixes, prefer_relative_imports
import 'package:flutter/material.dart';
import 'package:widgets_by_zpdl/material.dart';

import '../../widget/async_worker.dart';
import 'trip_planner_controller.dart';

class TripPlannerPage extends AsyncWorkerBuilder<TripPlannerController> {

  static const double hPadding = 16;
  static const double vPadding = 12;

  @override
  Widget asyncWorkerBuilder(BuildContext context) {
    return Container(
      color: R.color.backgroundColor,
    );
  }
}