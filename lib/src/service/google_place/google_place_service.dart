import 'package:get/get.dart';
import 'package:google_place/google_place.dart';

class GooglePlaceService extends GetxService {

  final googlePlace = GooglePlace("AIzaSyDxsgOxCnTK6mr0die1c_Iu7MAlljLgY9U");

  String recentSearch = '';

  Future<List<String>> queryAutocomplete(String? input) async {
    final results = <String>[];
    if(input == null || input.isEmpty) {
      return results;
    }

    final res = await googlePlace.queryAutocomplete.get(input, language: Get.locale?.languageCode);
    final predictions = res?.predictions;
    if(predictions != null) {
      for(final prediction in predictions) {
        final description = prediction.description;
        if(description != null) {
          results.add(description);
        }
      }
    }

    return results;
  }

  Future<List<AutocompletePrediction>> autocomplete(String? input) async {
    if(input == null || input.isEmpty) {
      return [];
    }
    final res = await googlePlace.autocomplete.get(input, language: Get.locale?.languageCode);
    return res?.predictions ?? [];
  }
}



