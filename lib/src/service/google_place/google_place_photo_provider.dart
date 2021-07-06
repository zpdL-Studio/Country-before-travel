import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'google_place_photo_model.dart';
import 'google_place_service.dart';

class GooglePlacePhotoProvider extends ImageProvider<GooglePlacePhotoProvider> {

  final GooglePlacePhotoModel model;

  const GooglePlacePhotoProvider(this.model);

  @override
  Future<GooglePlacePhotoProvider> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<GooglePlacePhotoProvider>(this);
  }

  @override
  ImageStreamCompleter load(GooglePlacePhotoProvider key, DecoderCallback decode) {
    final StreamController<ImageChunkEvent> chunkEvents = StreamController<ImageChunkEvent>();

    return MultiFrameImageStreamCompleter(
      codec: _loadAsync(key, chunkEvents, decode),
      scale: 1.0,
      chunkEvents: chunkEvents.stream,
      informationCollector: () sync* {
        yield ErrorDescription('GooglePlacePhotoProvider : $model');
      },
    );
  }

  Future<ui.Codec> _loadAsync(GooglePlacePhotoProvider key, StreamController<ImageChunkEvent> chunkEvents, DecoderCallback decode) async {
    try {
      assert(key == this);
      chunkEvents.add(ImageChunkEvent(
        cumulativeBytesLoaded: 0,
        expectedTotalBytes: 100,
      ));

      final Uint8List? bytes = await Get.find<GooglePlaceService>()
          .getPhoto(key.model.photoReference, key.model.width, key.model.height);

      if (bytes == null || bytes.lengthInBytes == 0) {
        // The file may become available later.
        PaintingBinding.instance!.imageCache!.evict(key);
        throw StateError('$model is empty and cannot be loaded as an image.');
      }

      chunkEvents.add(ImageChunkEvent(
        cumulativeBytesLoaded: 100,
        expectedTotalBytes: 100,
      ));

      return await decode(bytes);
    } catch(e) {
      rethrow;
    } finally {
      await chunkEvents.close();
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GooglePlacePhotoProvider &&
          runtimeType == other.runtimeType &&
          model == other.model;

  @override
  int get hashCode => model.hashCode;
}