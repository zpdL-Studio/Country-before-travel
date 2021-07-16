
import '../repository_connect.dart';
import 'mofa_notice.dart';

/// 외교부_공지사항
/// https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15075341

abstract class MofaNoticeRepository {
  Future<MofaNoticeResponse> getList({int pageNo = 1, int numOfRows = 100});
}

class MofaNoticeProvider extends RepositoryConnect implements MofaNoticeRepository {

  static const _baseUrl = 'http://apis.data.go.kr/1262000/NoticeService2';
  static const _serviceKey = 'NaVgDhq40X0zKVPM62LIi0v/xPluxRQB2WMzt7RTCtW/fw7gkgTRuHkTEGue2GAfc/F7wzNSizCoZvGFLquDEQ==';
  static const _returnType = 'JSON';

  @override
  void onInit() {
    super.onInit();
    httpClient.defaultDecoder =
        (val) => MofaNoticeResponse.fromJson(val as Map<String, dynamic>);

    httpClient.baseUrl = _baseUrl;
  }

  @override
  Future<MofaNoticeResponse> getList({int pageNo = 1, int numOfRows = 100}) async {
    return await reqGet<MofaNoticeResponse>(
      '/getNoticeList2',
      query: {
        'serviceKey': _serviceKey,
        'returnType': _returnType,
        'numOfRows': numOfRows.toString(),
        'pageNo': pageNo.toString(),
      },
    );
  }
}
