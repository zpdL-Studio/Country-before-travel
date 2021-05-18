import 'package:get/get.dart';

import '../../repository/country_code/country_code_repository.dart';
import 'search_controller.dart';

class SearchBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CountryCodeRepository>(() => MofaCountryCodeProvider());
    Get.lazyPut(() => SearchController(countryCodeRepository: Get.find()));
  }
}