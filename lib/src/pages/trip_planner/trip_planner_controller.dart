import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_before_travel/src/firebase/model/storage_image/storage_image_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../firebase/model/firebase_model.dart';
import '../../firebase/model/trip_plan/trip_plan_model.dart';
import '../../firebase/storage.dart';
import '../../service/google_place/google_place_service.dart';
import '../../service/trip_plan/trip_plan_service.dart';
import '../../tools/image_tool.dart' as image_tool;
import '../../widget/async_worker.dart';
import '../place_detail/place_detail_contract.dart' as detail;
import 'trip_planner_contract.dart';

class TripPlannerController extends GetxController with AsyncWorkerController {

  final TripPlanService tripPlanService;
  final GooglePlaceService googlePlace;

  TripPlannerController(this.tripPlanService, this.googlePlace);

  final PageController pageController = PageController();
  final Rxn<FirebaseModel<TripPlanModel>> tripPlanModel = Rxn();
  StreamSubscription? tripPlanModelSubscription;

  @override
  void onInit() async {
    super.onInit();

    final id = Get.parameters[Parameters.ID.value];
    asyncWorkerNotnull(_init(id));
  }

  Future<void> _init(String? id) async {
    final DocumentReference tripPlanDoc;
    if (id != null) {
      tripPlanDoc = await tripPlanService.get(id);
    } else {
      tripPlanDoc = await tripPlanService.create();
    }

    tripPlanModelSubscription = tripPlanDoc.snapshots().listen((event) {
      tripPlanModel.value = TripPlanModel.fromFireStore(event);
      update();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tripPlanModelSubscription?.cancel();
    super.onClose();
  }

  void addPlace(detail.PlaceDetailResult place) async {
    StorageImageModel? mainPhoto;
    StorageImageModel? thumbPhoto;

    final photo = place.photo;
    if(photo != null) {
      final data = await googlePlace.getPhoto(photo.photoReference, 1024, 1024);
      if(data != null) {
        image_tool.Image? image = await image_tool.decode(data);
        if(image != null) {
          // mainPhoto = await FireStorage.upload(
          //     FireStorage.createTripPlannerPhotoPath(_tripPlanDoc.id,
          //         tripDailyId: 'tripDailyId', tripPlaceId: 'tripPlaceId'),
          //     await image_tool.encodeJpg(image));
          // thumbPhoto = await FireStorage.upload(
          //     FireStorage.createTripPlannerPhotoPath(_tripPlanDoc.id,
          //         tripDailyId: 'tripDailyId', tripPlaceId: 'tripPlaceId'),
          //     await image_tool.encodeJpg(image,
          //         size: image_tool.containImageSize(
          //             image_tool.ImageSize(image.width, image.height),
          //             image_tool.ImageSize.size(256))));
          final width = 1024;
          final height = 1024;

          print('KKH image w : $width h: $height');

          final size = image_tool.containImageSize(
                          image_tool.ImageSize(width, height),
                          image_tool.ImageSize.size(256));

          print('KKH size $size');
        }
      }
    }
  }

}