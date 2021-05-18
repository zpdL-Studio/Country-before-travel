import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_code.freezed.dart';
part 'country_code.g.dart';

// ignore_for_file: non_constant_identifier_names
@freezed
class CountryCodeResponse with _$CountryCodeResponse {
  factory CountryCodeResponse({
    required int totalCount,
    required int currentCount,
    required int numOfRows,
    required int pageNo,
    required List<CountryCodeModel> data,
  }) = _CountryCodeResponse;

  factory CountryCodeResponse.fromJson(Map<String, dynamic> json) => _$CountryCodeResponseFromJson(json);

}

@freezed
class CountryCodeModel with _$CountryCodeModel {
  factory CountryCodeModel({
    required String country_eng_nm,
    required String country_nm,
    required String country_iso_alp2,
    required String iso_alp3,
    String? iso_num,
  }) = _CountryCodeModel;

  factory CountryCodeModel.fromJson(Map<String, dynamic> json) => _$CountryCodeModelFromJson(json);
}



