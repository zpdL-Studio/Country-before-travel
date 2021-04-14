// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mofa_notice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MofaNoticeResponse _$MofaNoticeResponseFromJson(Map<String, dynamic> json) {
  return MofaNoticeResponse(
    totalCount: json['totalCount'] as int,
    currentCount: json['currentCount'] as int,
    numOfRows: json['numOfRows'] as int,
    pageNo: json['pageNo'] as int,
    data: (json['data'] as List<dynamic>)
        .map((e) => MofaNoticeModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MofaNoticeResponseToJson(MofaNoticeResponse instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'currentCount': instance.currentCount,
      'numOfRows': instance.numOfRows,
      'pageNo': instance.pageNo,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

MofaNoticeModel _$MofaNoticeModelFromJson(Map<String, dynamic> json) {
  return MofaNoticeModel(
    id: json['id'] as String,
    title: json['title'] as String,
    written_dt: json['written_dt'] as String,
    txt_origin_cn: json['txt_origin_cn'] as String,
    file_download_url: json['file_download_url'] as String,
  );
}

Map<String, dynamic> _$MofaNoticeModelToJson(MofaNoticeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'written_dt': instance.written_dt,
      'txt_origin_cn': instance.txt_origin_cn,
      'file_download_url': instance.file_download_url,
    };
