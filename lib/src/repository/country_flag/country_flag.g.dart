// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_flag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CountryFlagResponse _$_$_CountryFlagResponseFromJson(
    Map<String, dynamic> json) {
  return _$_CountryFlagResponse(
    totalCount: json['totalCount'] as int,
    currentCount: json['currentCount'] as int,
    numOfRows: json['numOfRows'] as int,
    pageNo: json['pageNo'] as int,
    data: (json['data'] as List<dynamic>)
        .map((e) => CountryFlagModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_CountryFlagResponseToJson(
        _$_CountryFlagResponse instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'currentCount': instance.currentCount,
      'numOfRows': instance.numOfRows,
      'pageNo': instance.pageNo,
      'data': instance.data,
    };

_$_CountryFlagModel _$_$_CountryFlagModelFromJson(Map<String, dynamic> json) {
  return _$_CountryFlagModel(
    country_eng_nm: json['country_eng_nm'] as String,
    country_nm: json['country_nm'] as String,
    country_iso_alp2: json['country_iso_alp2'] as String,
    download_url: json['download_url'] as String,
  );
}

Map<String, dynamic> _$_$_CountryFlagModelToJson(
        _$_CountryFlagModel instance) =>
    <String, dynamic>{
      'country_eng_nm': instance.country_eng_nm,
      'country_nm': instance.country_nm,
      'country_iso_alp2': instance.country_iso_alp2,
      'download_url': instance.download_url,
    };
