import 'package:flutter/foundation.dart';

class Log {
  static void i(String msg) {
    if(!kReleaseMode) print(msg);
  }

  static void e(String msg) {
    print(msg);
  }
}