import 'package:country_before_travel/src/pages/mofa_notice/mofa_notice_controller.dart';
import 'package:country_before_travel/src/repository/mofa_notice/mofa_notice_repository.dart';
import 'package:get/get.dart';


class MofaNoticeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MofaNoticeRepository>(() => MofaNoticeProvider());
    Get.lazyPut(() => MofaNoticeListController(mofaNoticeRepository: Get.find()));
  }
}