import 'package:json_annotation/json_annotation.dart';

part 'mofa_notice.g.dart';

// ignore_for_file: non_constant_identifier_names
@JsonSerializable(explicitToJson: true)
class MofaNoticeResponse {
  final int totalCount;
  final int currentCount;
  final int numOfRows;
  final int pageNo;
  final List<MofaNoticeModel> data;

  MofaNoticeResponse({required this.totalCount, required this.currentCount, required this.numOfRows, required this.pageNo, required this.data});
  factory MofaNoticeResponse.fromJson(Map<String, dynamic> json) => _$MofaNoticeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MofaNoticeResponseToJson(this);
}

@JsonSerializable()
class MofaNoticeModel {
  final String id;
  final String title;
  final String written_dt;
  final String txt_origin_cn;
  final String file_download_url;

  MofaNoticeModel({required this.id, required this.title, required this.written_dt, required this.txt_origin_cn, required this.file_download_url});

  factory MofaNoticeModel.fromJson(Map<String, dynamic> json) => _$MofaNoticeModelFromJson(json);
  Map<String, dynamic> toJson() => _$MofaNoticeModelToJson(this);
}



