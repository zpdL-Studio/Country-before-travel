import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

DateTime? timeStampFromJson(Timestamp? timestamp) => timestamp != null
    ? DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch)
    : null;

Timestamp? timeStampToJson(DateTime? timestamp) =>
    timestamp != null ? Timestamp.fromDate(timestamp) : null;

const timeStamp = JsonKey(fromJson: timeStampFromJson, toJson: timeStampToJson);