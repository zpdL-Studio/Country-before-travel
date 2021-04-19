
import 'package:get/get_connect/connect.dart';

class RepositoryResponseStatueException implements Exception {
  final Uri? url;
  final int status;
  final String statusText;

  RepositoryResponseStatueException(this.url, this.status, this.statusText);

  factory RepositoryResponseStatueException.fromResponse(Response res) => RepositoryResponseStatueException(res.request?.url, res.statusCode ?? -1, res.statusText ?? '');

  @override
  String toString() {
    return 'RepositoryResponseStatueException{url: $url, status: $status, statusText: $statusText}';
  }
}

class RepositoryResponseEmptyException implements Exception {
  final Uri? url;

  RepositoryResponseEmptyException(this.url);

  @override
  String toString() {
    return 'RepositoryResponseEmptyException{url: $url}';
  }
}