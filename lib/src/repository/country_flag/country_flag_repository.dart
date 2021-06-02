import '../../tools/download_tool.dart';
import '../../tools/file_tool.dart';
import '../repository_connect.dart';
import 'country_flag.dart';


/// 외교부_국가∙지역별 국기 이미지
/// https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15076263

abstract class CountryFlagRepository {
  Future<String?> getFlagPath(String code);
}

class CountryFlagProvider extends RepositoryConnect implements CountryFlagRepository {

  static const _baseUrl = 'http://apis.data.go.kr/1262000/CountryFlagService2';
  static const _serviceKey = 'NaVgDhq40X0zKVPM62LIi0v/xPluxRQB2WMzt7RTCtW/fw7gkgTRuHkTEGue2GAfc/F7wzNSizCoZvGFLquDEQ==';
  static const _returnType = 'JSON';

  @override
  void onInit() {
    super.onInit();
    httpClient.defaultDecoder =
        (val) => CountryFlagResponse.fromJson(val as Map<String, dynamic>);

    httpClient.baseUrl = _baseUrl;
  }

  @override
  Future<String?> getFlagPath(String code) async {
    final localFile = await LocalFile.create('country_flag/$code');
    final file = localFile.file;
    if(file.existsSync()) {
      print("KKH file ${await file.length()}");
      return localFile.fullPath;
    }

    final res = await reqGet<CountryFlagResponse>(
      '/getCountryFlagList2',
      query: {
        'serviceKey': _serviceKey,
        'returnType': _returnType,
        'numOfRows': 100.toString(),
        'pageNo': 0.toString(),
        'cond[country_iso_alp2::EQ]': code,
      },
    );

    CountryFlagModel? model;
    for(final item in res.data) {
      if(item.country_iso_alp2 == code) {
        model = item;
        break;
      }
    }

    if(model != null) {
      final file = await DownloadTool.downloadFile(model.download_url, path: localFile.fullPath);
      // final extension = FileTool.getExtension(model.download_url);
      // final fileName = extension.isNotEmpty ? '${model.country_iso_alp2}.$extension' : '${model.country_iso_alp2}';

      // final localFile = await LocalFile.create('/country_flag/$code');
      // final result = await FileTool.move(file.path, localFile.fullPath);
      return file.path;
    }

    return null;
  }
}
