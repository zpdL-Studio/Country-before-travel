import '../../service/google_place/google_place_photo_model.dart';

enum Mode {
  DEFAULT,
  SELECT,
}

enum Parameters {
  PLACE_ID,
}

extension ParametersExtension on Parameters {
  String get value {
    switch (this) {
      case Parameters.PLACE_ID:
        return 'PLACE_ID';
    }
  }
}

class PlaceDetailResult {
  final String placeId;
  final String name;
  final String? address;
  final String? phoneNumber;
  final double lat;
  final double lng;
  final GooglePlacePhotoModel? photo;

  PlaceDetailResult({
    required this.placeId,
    required this.name,
    this.address,
    this.phoneNumber,
    required this.lat,
    required this.lng,
    this.photo,
  });
}