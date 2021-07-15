import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_before_travel/res/values.dart' as R; // ignore: library_prefixes, prefer_relative_imports
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:widgets_by_zpdl/material.dart';

import '../../service/google_place/google_place_photo_model.dart';
import '../../service/google_place/google_place_photo_provider.dart';
import '../../widget/async_worker.dart';
import '../../widget/rating_star_widget.dart';
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