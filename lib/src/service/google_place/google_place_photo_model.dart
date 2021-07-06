import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_place/google_place.dart';

part 'google_place_photo_model.freezed.dart';
part 'google_place_photo_model.g.dart';

@freezed
class GooglePlacePhotoModel with _$GooglePlacePhotoModel {
  factory GooglePlacePhotoModel({
    required String photoReference,
    required int width,
    required int height,
  }) = _GooglePlacePhotoModel;

  factory GooglePlacePhotoModel.fromJson(Map<String, dynamic> json) => _$GooglePlacePhotoModelFromJson(json);

  static GooglePlacePhotoModel? fromPhoto(Photo? photo) {
    final photoReference = photo?.photoReference;
    final width = photo?.width;
    final height = photo?.height;
    if(photoReference != null && width != null && height != null) {
      return GooglePlacePhotoModel(photoReference: photoReference, width: width, height: height);
    }
    return null;
  }

  static List<GooglePlacePhotoModel> detailToPhotos(DetailsResult? detailsResult) {
    final results = <GooglePlacePhotoModel>[];
    for(final photo in detailsResult?.photos ?? []) {
      final model = GooglePlacePhotoModel.fromPhoto(photo);
      if(model != null) {
        results.add(model);
      }
    }
    return results;
  }
}

extension GooglePlacePhotoModelExtension on GooglePlacePhotoModel {

  GooglePlacePhotoModel copyWithMaximumSize(int width, int height) =>
      GooglePlacePhotoModel(
          photoReference: photoReference,
          width: width < this.width ? width : this.width,
          height: height < this.height ? height : this.height);
}