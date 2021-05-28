
import 'package:get/get.dart';

import '../../log.dart';
import 'exceptions.dart';

abstract class RepositoryConnect extends GetConnect {

  Future<T> reqGet<T>(String url, {Map<String, String>? headers, String? contentType, Map<String, dynamic>? query, Decoder<T>? decoder}) async {
    _logReq('GET', url, headers, query);
    final response = await get(url,
        headers: headers,
        contentType: contentType,
        query: query,
        decoder: decoder);
    _logRes(response);
    return decodeFromResponse(response);
  }

  T decodeFromResponse<T>(Response<T> res) {
    if(res.isOk) {
      final body = res.body;
      if(body != null) {
        return body;
      }

      throw RepositoryResponseEmptyException(res.request?.url);
    }

    throw RepositoryResponseStatueException.fromResponse(res);
  }

  void _logReq(String method, String url, Map<String, String>? headers, Map<String, dynamic>? query) {
    String _baseUrl = httpClient.baseUrl != null ? '${httpClient.baseUrl}/' : '';
    String _headers = headers != null ? '\nheader : $headers' : '';
    String _query = query != null? '\nquery : $query' : '';
    Log.i('REQ : $method $_baseUrl$url$_headers$_query');
  }

  void _logRes(Response res) {
    Log.i('RES ${res.request?.method} ${res.statusText} ${res.request?.url}');
    if(res.isOk && res.body != null) {
      Log.i('RES ${res.body}');
    }
  }
}



