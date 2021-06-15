import 'package:get/get.dart';

import '../../repository/mofa_notice/mofa_notice_repository.dart';
import 'home_controller.dart';
import 'home_page.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MofaNoticeRepository>(() => MofaNoticeProvider());
    Get.lazyPut(() => HomeController(mofaNoticeRepository: Get.find()));
  }

  static GetPage getPage(String name) => GetPage(
    name: name,
    binding: HomeBindings(),
    page: () => HomePage(),
  );
}