import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'model/recent_country_code_model.dart';

export 'package:hive/hive.dart';

class HiveService extends GetxService {

  Future<HiveService> init() async {
    await Hive.initFlutter();
    return this;
  }

  Future<Box<T>> getBox<T>() async {
    var hiveBox = _getHiveBox<T>();
    if(hiveBox != null) {
      return _getBox<T>(hiveBox);
    }

    throw HiveBoxFoundException(T);
  }

  HiveBox? _getHiveBox<T>() {
    switch (T) {
      case RecentCountryCodeModel:
        return hiveBoxOfRecentCountryCode;
      default:
        return null;
    }
  }

  Future<Box<T>> _getBox<T>(HiveBox hiveBox) async {
    if(Hive.isBoxOpen(hiveBox.name)) {
      return Hive.box(hiveBox.name);
    }

    if(!Hive.isAdapterRegistered(hiveBox.typeAdapter.typeId)) {
      Hive.registerAdapter(hiveBox.typeAdapter);
    }
    return await Hive.openBox<T>(hiveBox.name);
  }
}

class HiveBox {
  final String name;
  final TypeAdapter typeAdapter;

  const HiveBox(this.name, this.typeAdapter);
}

class HiveBoxFoundException implements Exception {
  final Type type;

  HiveBoxFoundException(this.type);

  @override
  String toString() {
    return 'HiveBoxFoundException{type: $type}';
  }
}

const hiveBoxOfRecentCountryCodeTypeId = 1;
final hiveBoxOfRecentCountryCode = HiveBox('recent_country_code', RecentCountryCodeModelAdapter());