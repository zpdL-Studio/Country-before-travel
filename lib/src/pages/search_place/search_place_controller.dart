

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_place/google_place.dart';
import 'package:widgets_by_zpdl/node/node.dart';
import 'package:widgets_by_zpdl/node/node_list.dart';

import '../../service/google_place/google_place_service.dart';
import '../../widget/async_worker.dart';

class SearchPlaceController extends GetxController with AsyncWorkerController {

  final GooglePlaceService _googlePlace;

  SearchPlaceController({required GooglePlaceService googlePlace})
      : this._googlePlace = googlePlace;

  final TextEditingController textEditingController = TextEditingController();
  final _searchText = ''.obs;
  set searchText(String value) => _searchText.value = value;

  final autoCompletes = Rx<List<dynamic>>([]);

  static const _queryAutocompleteKey = '_queryAutocomplete';
  static const _autocompleteKey = '_autocomplete';

  final Nodes _node = Nodes(list: [
    NodeList<String>(key: _queryAutocompleteKey),
    NodeList<AutocompletePrediction>(key: _autocompleteKey),
  ]);

  List<String> get _queryAutocomplete => _node.findNodeByKey<NodeList<String>>(_queryAutocompleteKey)!;
  List<AutocompletePrediction> get _autocomplete => _node.findNodeByKey<NodeList<AutocompletePrediction>>(_autocompleteKey)!;

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
  }

  void _changedAutoComplete() {
    autoCompletes.value = _node.value;
  }

  void _init() async {
    final recentSearch = _googlePlace.recentSearch;

    textEditingController.text = recentSearch;
    textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: recentSearch.length));
    _searchText.value = recentSearch;

    debounce<String>(_searchText, (_) async {
      final results = await _googlePlace.queryAutocomplete(_);
      _queryAutocomplete.clear();
      _queryAutocomplete.addAll(results);
      _changedAutoComplete();
    }, time: Duration(seconds: 1));
  }

  void search(String value) async {
    if(value.isNotEmpty) {
      asyncWorker(Future(() async {
        textEditingController.text = value;
        final results = await _googlePlace.autocomplete(value);
        _autocomplete.clear();
        _autocomplete.addAll(results);
        _changedAutoComplete();
      }));
    }
  }

}