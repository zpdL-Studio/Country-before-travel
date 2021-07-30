import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import '../../log.dart';
import 'auth.dart';
import 'exception.dart';
import 'model/storage_image/storage_image_model.dart';

class FireStorage {

  static Future<String?> getDownloadURL(String? path) async {
    if(path == null || path.trim().isEmpty) return null;

    String? downloadURL;
    try {
      final ref = FirebaseStorage.instance.ref(path);
      downloadURL = await ref.getDownloadURL();
    } catch(e) {
      Log.e(e.toString());
    }
    return downloadURL;
  }

  static Future<StorageImageModel> upload(String path, Uint8List data,) async {
    final ref = await FirebaseStorage.instance.ref(path);
    await ref.putData(data);
    return StorageImageModel(path: path, url: await ref.getDownloadURL());
  }

  static String createTripPlannerPhotoPath(String tripPlannerId, {String? tripDailyId, String? tripPlaceId, String? name}) {
    final user = Auth().user;
    if(user == null) {
      throw AuthException('createTripPlannerPhotoPath $tripPlannerId daily: $tripDailyId place : $tripPlaceId name : $name');
    }
    final StringBuffer sb = StringBuffer('user/${user.uid}/trip_planner');
    if(tripDailyId != null) {
      sb.write('/$tripDailyId');
      if(tripPlaceId != null) {
        sb.write('/$tripPlaceId');
      }
    }
    if(name != null) {
      sb.write('/$name');
    } else {
      sb.write('/${Uuid().v4()}.jpg');
    }

    return sb.toString();
  }
}