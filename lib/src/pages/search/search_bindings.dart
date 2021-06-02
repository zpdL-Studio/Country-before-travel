import 'package:get/get.dart';

import '../../repository/country_code/country_code_repository.dart';
import '../../repository/country_flag/country_flag_repository.dart';
import 'search_controller.dart';

class SearchBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CountryCodeRepository>(() => MofaCountryCodeProvider());
    Get.lazyPut<CountryFlagRepository>(() => CountryFlagProvider());
    Get.lazyPut(() => SearchController(countryCodeRepository: Get.find(), countryFlagRepository: Get.find(), hiveService: Get.find()));
  }
}