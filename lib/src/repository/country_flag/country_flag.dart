import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_flag.freezed.dart';
part 'country_flag.g.dart';

// ignore_for_file: non_constant_identifier_names
@freezed
class CountryFlagResponse with _$CountryFlagResponse {
  factory CountryFlagResponse({
    required int totalCount,
    required int currentCount,
    required int numOfRows,
    required int pageNo,
    required List<CountryFlagModel> data,
  }) = _CountryFlagResponse;

  factory CountryFlagResponse.fromJson(Map<String, dynamic> json) => _$CountryFlagResponseFromJson(json);

}

@freezed
class CountryFlagModel with _$CountryFlagModel {
  factory CountryFlagModel({
    required String country_eng_nm,
    required String country_nm,
    required String country_iso_alp2,
    required String download_url,
  }) = _CountryFlagModel;

  factory CountryFlagModel.fromJson(Map<String, dynamic> json) => _$CountryFlagModelFromJson(json);
}



