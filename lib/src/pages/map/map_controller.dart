
import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';

import '../../widget/async_worker.dart';

class MapController extends GetxController with AsyncWorkerController {

  MapController();

  Completer<GoogleMapController> mapController = Completer();

  final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  // final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> goToTheLake() async {
    var googlePlace = GooglePlace("AIzaSyDxsgOxCnTK6mr0die1c_Iu7MAlljLgY9U");
    var result = await googlePlace.autocomplete.get("1600 Amphitheatre");
    // final GoogleMapController controller = await mapController.future;
    // controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
    print("KKH result ${result?.status}");
    print("KKH result ${result?.predictions?.length}");

  }
}