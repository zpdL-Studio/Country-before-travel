import 'package:get/get.dart';

import '../../repository/mofa_notice/mofa_notice_repository.dart';
import 'mofa_notice_controller.dart';


class MofaNoticeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MofaNoticeRepository>(() => MofaNoticeProvider());
    Get.lazyPut(() => MofaNoticeListController(mofaNoticeRepository: Get.find()));
  }
}