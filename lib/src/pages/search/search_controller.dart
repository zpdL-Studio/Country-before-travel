
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/shared_preferences.dart';
import '../../model/country_code_model.dart';
import '../../repository/country_code/country_code_repository.dart';
import '../../repository/country_flag/country_flag_repository.dart';
import '../../service/hive/hive_service.dart';
import '../../service/hive/model/recent_country_code_model.dart';
import '../../widget/async_worker.dart';

class SearchController extends GetxController with AsyncWorkerController {

  final CountryCodeRepository countryCodeRepository;
  final CountryFlagRepository countryFlagRepository;
  final HiveService hiveService;

  SearchController({required this.countryCodeRepository, required this.countryFlagRepository, required this.hiveService});

  final TextEditingController textEditingController = TextEditingController();

  Box<RecentCountryCodeModel>? hiveBox;

  final _searchedList = Rx<List<CountryCodeModel>?>(null);
  List<CountryCodeModel> get searchedList => _searchedList.value ?? [];

  final _searchedText = RxnString(null);
  String? get searchedText => _searchedText.value;

  final _recentList = Rx<List<RecentCountryCodeModel>?>(null);
  List<RecentCountryCodeModel> get recentList => _recentList.value ?? [];

  @override
  void onInit() {
    super.onInit();

    asyncWorker(_init());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    SharedPreferences.set(SharedPreferencesKey.RECENT_SEARCH, textEditingController.text);
    textEditingController.dispose();
  }

  Future<void> _init() async {
    try {
      hiveBox = await hiveService.getBox<RecentCountryCodeModel>();
      _refreshRecent();
    } catch(e) {
    }

    try {
      final recentSearch = await SharedPreferences.getOrDefault(SharedPreferencesKey.RECENT_SEARCH, '');
      if(recentSearch.isNotEmpty) {
        var res = await countryCodeRepository.getCountyCodeList(cond: recentSearch);
        _searchedList.value = res.data.map((e) => RecentCountryCodeModel(code: e.country_iso_alp2, name: e.country_nm)).toList();
      } else {
        _searchedList.value = [];
      }

      _searchedText.value = recentSearch;
      textEditingController.text = recentSearch;
      textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: recentSearch.length));
    } catch(e) {
      // _mofaNoticeResponse.addError(e);
    }
  }


  void _refreshRecent() {
    final box = hiveBox;
    if(box != null) {
      _recentList.value = box.values.toList().reversed.toList();
    }
  }

  void _addRecent(CountryCodeModel model) async {
    final box = hiveBox;
    if(box != null) {
      var existKeys = <dynamic>[];
      for(int i = 0; i < box.length; i++) {
        if(box.getAt(i)?.countryCode == model.countryCode) {
          existKeys.add(box.keyAt(i));
        }
      }

      if(existKeys.isNotEmpty) {
        await box.deleteAll(existKeys);
      }

      while(box.length >= 5) {
        await box.deleteAt(0);
      }

      await box.add(RecentCountryCodeModel.fromModel(model));
      _refreshRecent();
    }
  }

  void showRecent() {
    _searchedText.value = '';
    _searchedList.value = [];
  }

  void search() {
    asyncWorker(Future(() async {
      try {
        final text = textEditingController.text;
        if (_searchedText != text) {
          var res = await countryCodeRepository.getCountyCodeList(cond: text);
          _searchedText.value = text;
          _searchedList.value = res.data
              .map((e) => RecentCountryCodeModel(
                  code: e.country_iso_alp2, name: e.country_nm))
              .toList();
        }
      } catch (e) {}
    }));
  }

  void selectModel(CountryCodeModel model) async {
    _addRecent(model);
  }
}