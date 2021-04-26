import 'package:country_before_travel/src/repository/mofa_notice/mofa_notice.dart';
import 'package:country_before_travel/src/repository/mofa_notice/mofa_notice_repository.dart';
import 'package:country_before_travel/src/widget/loadings.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class MofaNoticeListController extends GetxController with LoadingController {
  final MofaNoticeRepository mofaNoticeRepository;

  MofaNoticeListController({required this.mofaNoticeRepository});

  final _list = Rx<List<MofaNoticeModel>?>(null);
  List<MofaNoticeModel>? get list => _list.value;

  int _pageNo = 1;

  @override
  void onInit() {
    super.onInit();
    print("KKH MofaNoticeListController onInit");
    loadWork(mofaNoticeRepository.getList(pageNo: _pageNo, numOfRows: 100))
        .then((value) {
      _list.value = value.data;
    });
  }

  @override
  void onReady() {
    super.onReady();
    print("KKH MofaNoticeListController onReady");

  }

  @override
  void onClose() {
    super.onClose();
    print("KKH MofaNoticeListController onClose");
  }
}