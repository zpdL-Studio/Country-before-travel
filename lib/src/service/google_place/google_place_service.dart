import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:google_place/google_place.dart';

import '../../../log.dart';
import '../../tools/lru_cache/lru_cache.dart';
import 'google_place_model.dart';

class GooglePlaceService extends GetxService {

  Future<GooglePlaceService> init() async {
    return this;
  }

  final googlePlace = GooglePlace("AIzaSyDxsgOxCnTK6mr0die1c_Iu7MAlljLgY9U");

  String recentSearch = '';
  QueryAutoComplete? recentQueryAutoComplete;

  final LruCache<String, AutocompleteResponse> queryAutoCompleteCache = LruCache.memory<String, AutocompleteResponse>(maximumSize: 64);
  final LruCache<String, TextSearchResponse> textSearchCache = LruCache.memory<String, TextSearchResponse>(maximumSize: 32);

  Future<List<AutocompletePrediction>> queryAutocomplete(String? input) async {
    if(input == null || input.isEmpty) {
      return [];
    }
    final cacheRes = await queryAutoCompleteCache[input];
    if(cacheRes != null) {
      Log.i("queryAutoCompleteCache : $input");
      return cacheRes.predictions ?? [];
    }

    final res = await googlePlace.queryAutocomplete.get(input, language: Get.locale?.languageCode);
    if(res != null) {
      queryAutoCompleteCache[input] = res;
    }
    return res?.predictions ?? [];
  }

  Future<List<AutocompletePrediction>> autocomplete(String? input) async {
    if(input == null || input.isEmpty) {
      return [];
    }
    final res = await googlePlace.autocomplete.get(input, language: Get.locale?.languageCode);
    return res?.predictions ?? [];
  }

  Future<GooglePlaceSearchResponse> searchText(String? input) async {
    if(input == null || input.isEmpty) {
      return GooglePlaceSearchResponse.empty();
    }
    final cacheRes = await textSearchCache[input];
    if(cacheRes != null) {
      Log.i("textSearchCache : $input");
      return GooglePlaceSearchResponse.textSearchResponse(input, cacheRes);
    }
    final res = await googlePlace.search.getTextSearch(input, language: Get.locale?.languageCode,);
    if(res != null) {
      textSearchCache[input] = res;
    }
    return GooglePlaceSearchResponse.textSearchResponse(input, res);
  }

  Future<DetailsResponse?> getPlaceDetails(String id) =>
      googlePlace.details.get(
        id,
        language: Get.locale?.languageCode,
      );

  Future<Uint8List?> getPhoto(String photoReference, int width, int height) =>
      googlePlace.photos.get(photoReference, width, height);
}