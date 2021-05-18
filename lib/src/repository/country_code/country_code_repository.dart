import 'package:get/get.dart';

import '../repository_helper.dart';
import 'country_code.dart';

/// 외교부_국가·지역별 표준코드
/// https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15075346

abstract class CountryCodeRepository {
  Future<dynamic> getCountyCodeList({int pageNo = 1, int numOfRows = 100});
}

class MofaCountryCodeProvider extends GetConnect implements CountryCodeRepository {

  static const _baseUrl = 'http://apis.data.go.kr/1262000/CountryCodeService2';
  static const _serviceKey = 'NaVgDhq40X0zKVPM62LIi0v/xPluxRQB2WMzt7RTCtW/fw7gkgTRuHkTEGue2GAfc/F7wzNSizCoZvGFLquDEQ==';
  static const _returnType = 'JSON';

  @override
  void onInit() {
    super.onInit();
    httpClient.defaultDecoder =
        (val) => CountryCodeResponse.fromJson(val as Map<String, dynamic>);

    httpClient.baseUrl = _baseUrl;
  }

  @override
  Future<CountryCodeResponse> getCountyCodeList({int pageNo = 1, int numOfRows = 100}) async {
    final res = await get<CountryCodeResponse>(
      '/getCountryCodeList2',
      query: {
        'serviceKey': _serviceKey,
        'returnType': _returnType,
        'numOfRows': numOfRows.toString(),
        'pageNo': pageNo.toString(),
      },
    );
    return decodeFromResponse(res);
  }
}
