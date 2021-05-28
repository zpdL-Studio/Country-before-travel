import 'package:hive/hive.dart';

import '../../../model/country_code_model.dart' as model;
import '../hive_service.dart';

part 'recent_country_code_model.g.dart';

@HiveType(typeId: hiveBoxOfRecentCountryCodeTypeId)
class RecentCountryCodeModel extends model.CountryCodeModel {

  @HiveField(0, defaultValue: '')
  final String name;
  @HiveField(1, defaultValue: '')
  final String code;

  RecentCountryCodeModel({
    required this.name,
    required this.code,
  });

  factory RecentCountryCodeModel.fromModel(model.CountryCodeModel model) {
    return RecentCountryCodeModel(name: model.countryName, code: model.countryCode);
  }

  @override
  String get countryCode => code;

  @override
  String get countryName => name;

}



