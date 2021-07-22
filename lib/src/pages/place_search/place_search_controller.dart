import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../service/google_place/google_place_model.dart';
import '../../service/google_place/google_place_service.dart';
import '../../tools/aync_debounce_worker.dart';
import '../../widget/async_worker.dart';
import 'place_search_contract.dart';

class PlaceSearchController extends GetxController with AsyncWorkerController {
  final Mode mode;
  final GooglePlaceService _googlePlace;
  late final AsyncDebounceWorkerManager<QueryAutoComplete> _asyncDebounceWorker;

  PlaceSearchController(this.mode, {required GooglePlaceService googlePlace})
      : this._googlePlace = googlePlace;

  final FocusNode focusNode = FocusNode();
  final searchTextHasFocus = false.obs;

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
    _asyncDebounceWorker = AsyncDebounceWorkerManager(onDebounce: (_) {
      autoCompletes.value = _;
    });
    searchTextHasFocus.value = focusNode.hasFocus;
    focusNode.addListener(_changedFocus);
    _init();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    _asyncDebounceWorker.onDebounce = null;
    focusNode.removeListener(_changedFocus);

    _googlePlace.recentSearch = textEditingController.text;
    _googlePlace.recentQueryAutoComplete = autoCompletes.value;
  }

  void _init() async {
    final recentSearch = _googlePlace.recentSearch;

    textEditingController.text = recentSearch;
    textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: recentSearch.length));
    _searchText.value = recentSearch;
    autoCompletes.value = _googlePlace.recentQueryAutoComplete;

    _searchText.listen((_) {
      if(_.trim().length > 1) {
        _asyncDebounceWorker.debounceWorker(() async {
          final results = await _googlePlace.queryAutocomplete(_);
          return QueryAutoComplete(_, results);
        });
      }
    });
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
      focusNode.unfocus();
      searchResponse.value = results;
    }));
  }

  void _changedFocus() {
    searchTextHasFocus.value = focusNode.hasFocus;
  }
}