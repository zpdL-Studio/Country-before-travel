import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_place/google_place.dart';

import '../../service/google_place/google_place_photo_model.dart';
import '../../service/google_place/google_place_service.dart';
import '../../widget/async_worker.dart';


const ParametersPlaceId = 'place_id';

class PlaceDetailController extends GetxController with AsyncWorkerController {

  final GooglePlaceService _googlePlace;

  PlaceDetailController({required GooglePlaceService googlePlace})
      : this._googlePlace = googlePlace;

  String? _placeId;
  set placeId(String? placeId) {
    if(_placeId != placeId) {
      _placeId = placeId;
      _init();
    }
  }

  DetailsResult? _detailsResult;
  set detailsResult(DetailsResult? detailsResult) {
    _detailsResult = detailsResult;
    _photos = GooglePlacePhotoModel.detailToPhotos(_detailsResult);
    update();
  }
  DetailsResult? get detailsResult => _detailsResult;

  List<GooglePlacePhotoModel> _photos = [];
  List<GooglePlacePhotoModel> get photos => _photos;

  final PageController photoController = PageController();

  @override
  void onInit() {
    super.onInit();

    placeId = Get.parameters[ParametersPlaceId];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _init() async {
    final id = _placeId;
    if(id != null) {
      final result = await asyncWorker(_googlePlace.getPlaceDetails(id));
      detailsResult = result?.result;
    }
  }
}