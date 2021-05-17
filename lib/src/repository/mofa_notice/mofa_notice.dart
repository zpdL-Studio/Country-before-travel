import 'package:freezed_annotation/freezed_annotation.dart';

part 'mofa_notice.freezed.dart';
part 'mofa_notice.g.dart';

// ignore_for_file: non_constant_identifier_names
@freezed
class MofaNoticeResponse with _$MofaNoticeResponse {
  factory MofaNoticeResponse({
    required int totalCount,
    required int currentCount,
    required int numOfRows,
    required int pageNo,
    required List<MofaNoticeModel> data,
  }) = _MofaNoticeResponse;

  factory MofaNoticeResponse.fromJson(Map<String, dynamic> json) => _$MofaNoticeResponseFromJson(json);

}

@freezed
class MofaNoticeModel with _$MofaNoticeModel {
  factory MofaNoticeModel({
    required String id,
    required String title,
    required String written_dt,
    String? txt_origin_cn,
    required String file_download_url,
  }) = _MofaNoticeModel;

  factory MofaNoticeModel.fromJson(Map<String, dynamic> json) => _$MofaNoticeModelFromJson(json);
}



