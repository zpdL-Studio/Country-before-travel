import 'package:country_before_travel/src/repository/mofa_notice/mofa_notice_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class HomeController extends GetxController {
  final MofaNoticeRepository mofaNoticeRepository;

  HomeController({required this.mofaNoticeRepository});

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;

  @override
  void onInit() {
    super.onInit();
    print("KKH HomeController onInit");

    final result = mofaNoticeRepository.getList(numOfRows: 5);
  }

  @override
  void onReady() {
    super.onReady();
    print("KKH HomeController onReady");
  }

  @override
  void onClose() {
    super.onClose();
    print("KKH HomeController onClose");
  }
}