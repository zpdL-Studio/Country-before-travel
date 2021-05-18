// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CountryCodeResponse _$_$_CountryCodeResponseFromJson(
    Map<String, dynamic> json) {
  return _$_CountryCodeResponse(
    totalCount: json['totalCount'] as int,
    currentCount: json['currentCount'] as int,
    numOfRows: json['numOfRows'] as int,
    pageNo: json['pageNo'] as int,
    data: (json['data'] as List<dynamic>)
        .map((e) => CountryCodeModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_CountryCodeResponseToJson(
        _$_CountryCodeResponse instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'currentCount': instance.currentCount,
      'numOfRows': instance.numOfRows,
      'pageNo': instance.pageNo,
      'data': instance.data,
    };

_$_CountryCodeModel _$_$_CountryCodeModelFromJson(Map<String, dynamic> json) {
  return _$_CountryCodeModel(
    country_eng_nm: json['country_eng_nm'] as String,
    country_nm: json['country_nm'] as String,
    country_iso_alp2: json['country_iso_alp2'] as String,
    iso_alp3: json['iso_alp3'] as String,
    iso_num: json['iso_num'] as String?,
  );
}

Map<String, dynamic> _$_$_CountryCodeModelToJson(
        _$_CountryCodeModel instance) =>
    <String, dynamic>{
      'country_eng_nm': instance.country_eng_nm,
      'country_nm': instance.country_nm,
      'country_iso_alp2': instance.country_iso_alp2,
      'iso_alp3': instance.iso_alp3,
      'iso_num': instance.iso_num,
    };
