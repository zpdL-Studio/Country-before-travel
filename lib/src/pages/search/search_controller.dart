import 'package:get/get.dart';

import '../../repository/country_code/country_code_repository.dart';

class SearchController extends GetxController {

  final CountryCodeRepository countryCodeRepository;

  SearchController({required this.countryCodeRepository});

  @override
  void onInit() {
    super.onInit();

    init();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void init() async {
    try {
      var list = await countryCodeRepository.getCountyCodeList();
      print("KKH $list");
    } catch(e) {
      // _mofaNoticeResponse.addError(e);
    }
  }
}