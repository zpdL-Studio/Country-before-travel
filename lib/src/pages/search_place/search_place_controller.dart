

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../service/google_place/google_place_model.dart';
import '../../service/google_place/google_place_service.dart';
import '../../widget/async_worker.dart';

class SearchPlaceController extends GetxController with AsyncWorkerController {

  final GooglePlaceService _googlePlace;

  SearchPlaceController({required GooglePlaceService googlePlace})
      : this._googlePlace = googlePlace;

  final TextEditingController textEditingController = TextEditingController();
  final _searchText = ''.obs;
  set searchText(String value) => _searchText.value = value;

  final autoCompletes = Rxn<QueryAutoComplete>();
  final searchResponse = Rx<GooglePlaceSearchResponse>(GooglePlaceSearchResponse.empty());

  // final autoComplete = RxString('');
  // static const _queryAutocompleteKey = '_queryAutocomplete';
  // static const _autocompleteKey = '_autocomplete';

  // final Nodes _node = Nodes(list: [
  //   NodeList<String>(key: _queryAutocompleteKey),
  //   NodeList<AutocompletePrediction>(key: _autocompleteKey),
  // ]);
  //
  // List<String> get _queryAutocomplete => _node.findNodeByKey<NodeList<String>>(_queryAutocompleteKey)!;
  // List<AutocompletePrediction> get _autocomplete => _node.findNodeByKey<NodeList<AutocompletePrediction>>(_autocompleteKey)!;

  @override
  void onInit() {
    super.onInit();

    _init();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

    _googlePlace.recentSearch = textEditingController.text;
    _googlePlace.recentQueryAutoComplete = autoCompletes.value;
  }

  void _init() async {
    final recentSearch = _googlePlace.recentSearch;

    textEditingController.text = recentSearch;
    textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: recentSearch.length));
    _searchText.value = recentSearch;
    autoCompletes.value = _googlePlace.recentQueryAutoComplete;

    debounce<String>(_searchText, (_) async {
      final results = await _googlePlace.queryAutocomplete(_);
      autoCompletes.value = QueryAutoComplete(_, results);
    }, time: Duration(milliseconds: 500));
  }

  void searchByQuery(String value) {
    if(value.isNotEmpty) {
      textEditingController.text = value;
      textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: value.length));
      _search(value);
    }
  }

  void search() async {
    final text = textEditingController.text;
    if(text.isNotEmpty) {
      _search(text);
    }
  }

  void _search(String value) {
    asyncWorker(Future(() async {
      final results = await _googlePlace.searchText(value);
      autoCompletes.value = null;
      searchResponse.value = results;
    }));
  }
}