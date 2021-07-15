import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_place/google_place.dart';

import '../../service/google_place/google_place_photo_model.dart';
import '../../service/google_place/google_place_service.dart';
import '../../widget/async_worker.dart';


const ParametersPlaceId = 'place_id';

class TripPlannerController extends GetxController with AsyncWorkerController {

  TripPlannerController();

  final PageController photoController = PageController();

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
}