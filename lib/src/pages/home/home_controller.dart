import 'package:country_before_travel/src/repository/mofa_notice/mofa_notice.dart';
import 'package:country_before_travel/src/repository/mofa_notice/mofa_notice_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class HomeController extends GetxController {
  final MofaNoticeRepository mofaNoticeRepository;

  HomeController({required this.mofaNoticeRepository});

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;

  final _scale = 1.0.obs;
  set scale(double value) => _scale.value = value;
  double get scale => _scale.value;

  final _degree = 0.0.obs;
  set degree(double value) => _degree.value = value;
  double get degree => _degree.value;

  final _mofaNoticeResponse = Rx<MofaNoticeResponse?>(null);
  set mofaNoticeResponse(MofaNoticeResponse? value) => _mofaNoticeResponse.value = value;
  MofaNoticeResponse? get mofaNoticeResponse => _mofaNoticeResponse.value;

  @override
  void onInit() {
    super.onInit();
    print("KKH HomeController onInit");

    init();
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

  void init() async {
    // try {
    //   mofaNoticeResponse = await mofaNoticeRepository.getList(numOfRows: 5);
    // } catch(e) {
    //   print("KKH e");
    //   _mofaNoticeResponse.addError(e);
    // }
  }
}