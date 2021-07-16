import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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