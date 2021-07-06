
import 'package:google_place/google_place.dart';

class QueryAutoComplete {
  final String query;
  final List<AutocompletePrediction> predictions;

  QueryAutoComplete(this.query, this.predictions);
}

class GooglePlaceSearchResponse {
  final String input;
  final String? nextPageToken;
  final List<GooglePlaceSearchResult> results;

  GooglePlaceSearchResponse(this.input, this.nextPageToken, this.results);

  factory GooglePlaceSearchResponse.empty() => GooglePlaceSearchResponse('', null, []);

  factory GooglePlaceSearchResponse.textSearchResponse(String input, TextSearchResponse? response) {
    final List<GooglePlaceSearchResult> results = [];
    final resList = response?.results ?? [];
    for(final result in resList) {
      final googlePlaceSearchResult = GooglePlaceSearchResult.valid(result);
      if(googlePlaceSearchResult != null) {
        results.add(googlePlaceSearchResult);
      }
    }

    return GooglePlaceSearchResponse(input, response?.nextPageToken, results);
  }
}

class GooglePlaceSearchResult {
  final SearchResult? searchResult;

  GooglePlaceSearchResult._(this.searchResult, this.placeId, this.lat, this.lng, this.name, this.address, this.icon);

  final String placeId;
  final double lat;
  final double lng;
  final String name;
  final String address;
  final String? icon;

  static GooglePlaceSearchResult? valid(SearchResult? searchResult) {
    final String? placeId = searchResult?.placeId;
    final double? lat = searchResult?.geometry?.location?.lat;
    final double? lng = searchResult?.geometry?.location?.lng;
    final String? name = searchResult?.name;
    final String? address = searchResult?.formattedAddress;
    if(placeId != null && lat != null && lng != null && name != null && address != null) {
      return GooglePlaceSearchResult._(searchResult, placeId, lat, lng, name, address, searchResult?.icon);
    }
    return null;
  }
}
