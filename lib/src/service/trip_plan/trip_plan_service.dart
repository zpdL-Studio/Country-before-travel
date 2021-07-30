
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../firebase/firestore.dart';
import '../../firebase/model/trip_plan/trip_plan_model.dart';
import '../auth/auth_service.dart';
import '../exception.dart';


class TripPlanService extends GetxService {

  static const String COLLECTION_NAME = 'trip_plan';

  Future<TripPlanService> init() async {
    return this;
  }

  String get _uid {
    final uid = Get.find<AuthService>().authModel.value?.user.uid;
    if(uid != null) {
      return uid;
    }
    throw AuthException('TripPlanService : requires auth');
  }

  Future<DocumentReference> create() async {
    return await FireStoreCollections.USER.doc(_uid).collection(COLLECTION_NAME).add(TripPlanModel(
      creation_time: DateTime.now(),
    ).toJson());
  }

  DocumentReference get(String id, {String? uid}) =>
    FireStoreCollections.USER.doc(uid ?? _uid).collection(COLLECTION_NAME).doc(id);

}