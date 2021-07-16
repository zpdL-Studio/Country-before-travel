import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sheet_localization/flutter_sheet_localization.dart';

part 'localization.g.dart';

late AppLocalizationsData appLocalization;

// extension AppLocalizationsExtensions on BuildContext {
//   AppLocalizationsData get localizations {
//     return Localizations.of<AppLocalizationsData>(this, AppLocalizationsData)!;
//   }
// }

@SheetLocalization('14TSCGhzvm7NCVTFC2O8_kJIfAogAnfub_HgNUjp1K_0', '0', 2) // <- See 1. to get DOCID and SHEETID
// the `1` is the generated version. You must increment it each time you want to regenerate
// a new version of the labels.
class AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizationsData> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => localizedLabels.containsKey(locale);

  @override
  Future<AppLocalizationsData> load(Locale locale) {
    appLocalization = localizedLabels[locale]!;
    return SynchronousFuture<AppLocalizationsData>(appLocalization);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
