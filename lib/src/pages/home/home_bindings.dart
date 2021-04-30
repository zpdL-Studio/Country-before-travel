import 'package:get/get.dart';

import '../../repository/mofa_notice/mofa_notice_repository.dart';
import 'home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MofaNoticeRepository>(() => MofaNoticeProvider());
    Get.lazyPut(() => HomeController(mofaNoticeRepository: Get.find()));
  }
}