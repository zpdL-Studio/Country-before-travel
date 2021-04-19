
import 'package:get/get_connect/connect.dart';

import 'exceptions.dart';

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


