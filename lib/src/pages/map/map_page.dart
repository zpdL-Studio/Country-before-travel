//import 'dart:io' as io;

//import 'package:country_before_travel/res/values.dart' as R; // ignore: library_prefixes, prefer_relative_imports
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widgets_by_zpdl/material.dart';

import '../../widget/async_worker.dart';
import 'map_controller.dart';

class MapPage extends AsyncWorkerBuilder<MapController> {

  @override
  Widget asyncWorkerBuilder(BuildContext context) {
    return IosOutSideUnFocusTab(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Google Map'),
        ),
        body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: controller.kGooglePlex,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: (GoogleMapController googleMapController) {
          controller.mapController.complete(googleMapController);
        },
      ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: controller.goToTheLake,
          label: Text('To the lake!'),
          icon: Icon(Icons.directions_boat),
        ),
      ),
    );
  }
}
