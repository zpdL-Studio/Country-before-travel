import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../firebase_json_annotation.dart';
import '../firebase_model.dart';

part 'storage_image_model.freezed.dart';
part 'storage_image_model.g.dart';

@freezed
class StorageImageModel with _$StorageImageModel {
  factory StorageImageModel({
    required String path,
    required String url,
  }) = _StorageImageModel;

  factory StorageImageModel.fromJson(Map<String, dynamic> json) => _$StorageImageModelFromJson(json);

}