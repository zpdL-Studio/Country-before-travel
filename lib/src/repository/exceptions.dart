
import 'package:get/get_connect/connect.dart';

class RepositoryStatueException implements Exception {
  final int status;
  final String statusText;

  RepositoryStatueException(this.status, this.statusText);

  factory RepositoryStatueException.fromResponse(Response response) => RepositoryStatueException(response.statusCode ?? -1, response.statusText ?? '');

  @override
  String toString() {
    return 'RepositoryStatueException{status: $status, statusText: $statusText}';
  }
}



