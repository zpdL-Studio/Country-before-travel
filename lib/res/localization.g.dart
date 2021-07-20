// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization.dart';

// **************************************************************************
// SheetLocalizationGenerator
// **************************************************************************

final localizedLabels = <Locale, AppLocalizationsData>{
  Locale.fromSubtags(languageCode: 'en'): const AppLocalizationsData(
    okLow: 'ok',
    ok: 'Ok',
    cancelLow: 'cancel',
    cancel: 'Cancel',
    closeLow: 'close',
    close: 'Close',
    multiline: 'This is\n\na\n\nmultiline example.',
    auth: const AppLocalizationsDataAuth(
      anonymously: 'Anonymously',
      login: 'Login',
    ),
    plurals: const AppLocalizationsDataPlurals(
      manMultiple: 'men',
      manOne: 'man',
      manZero: 'man',
    ),
    templated: const AppLocalizationsDataTemplated(
      contactFemale: 'Mrs {{last_name}}!',
      contactMale: 'Mr {{last_name}}!',
      hello: 'Hello {{first_name}}!',
      date: const AppLocalizationsDataTemplatedDate(
        pattern: 'Today : {{date:DateTime[EEE, M/d/y]}}',
        simple: 'Today : {{date:DateTime}}',
      ),
      numbers: const AppLocalizationsDataTemplatedNumbers(
        formatted: 'The price is {{price:double[compactCurrency]}}',
        simple: 'The price is {{price:double}}\$',
        count: 'There are {{count:int}}\ items.',
      ),
    ),
    dates: const AppLocalizationsDataDates(
      month: const AppLocalizationsDataDatesMonth(
        april: 'april',
        march: 'march',
        february: 'february',
        january: 'january',
      ),
      weekday: const AppLocalizationsDataDatesWeekday(
        sunday: 'sunday',
        saturday: 'saturday',
        friday: 'friday',
        thursday: 'thursday',
        wednesday: 'wednesday',
        tuesday: 'tuesday',
        monday: 'MONDAY',
      ),
    ),
  ),
  Locale.fromSubtags(languageCode: 'ko'): const AppLocalizationsData(
    okLow: '확인',
    ok: '확인',
    cancelLow: '취소',
    cancel: '취소',
    closeLow: '닫기',
    close: '닫기',
    multiline: 'This is\n\na\n\nmultiline example.',
    auth: const AppLocalizationsDataAuth(
      anonymously: '익명',
      login: '로그인',
    ),
    plurals: const AppLocalizationsDataPlurals(
      manMultiple: '남자',
      manOne: '남자',
      manZero: '남자',
    ),
    templated: const AppLocalizationsDataTemplated(
      contactFemale: '{{last_name}}!',
      contactMale: '{{last_name}}!',
      hello: '안녕 {{first_name}}!',
      date: const AppLocalizationsDataTemplatedDate(
        pattern: '오늘 : {{date:DateTime[EEE, M/d/y]}}',
        simple: '오늘 : {{date:DateTime}}',
      ),
      numbers: const AppLocalizationsDataTemplatedNumbers(
        formatted: '가격은 {{price:double[compactCurrency]}}입니다.',
        simple: '가격은 {{price:double}}원입니다.',
        count: '{{count:int}}\ 개입니다..',
      ),
    ),
    dates: const AppLocalizationsDataDates(
      month: const AppLocalizationsDataDatesMonth(
        april: '4월',
        march: '3월',
        february: '2월',
        january: '1월',
      ),
      weekday: const AppLocalizationsDataDatesWeekday(
        sunday: '일요일',
        saturday: '토요일',
        friday: '금요일',
        thursday: '목요일',
        wednesday: '수요일',
        tuesday: '화요일',
        monday: '월요일',
      ),
    ),
  ),
};
enum Plural {
  multiple,
  one,
  zero,
}
enum Gender {
  female,
  male,
}

class AppLocalizationsData {
  const AppLocalizationsData({
    required this.okLow,
    required this.ok,
    required this.cancelLow,
    required this.cancel,
    required this.closeLow,
    required this.close,
    required this.multiline,
    required this.auth,
    required this.plurals,
    required this.templated,
    required this.dates,
  });

  final String okLow;
  final String ok;
  final String cancelLow;
  final String cancel;
  final String closeLow;
  final String close;
  final String multiline;
  final AppLocalizationsDataAuth auth;
  final AppLocalizationsDataPlurals plurals;
  final AppLocalizationsDataTemplated templated;
  final AppLocalizationsDataDates dates;
  factory AppLocalizationsData.fromJson(Map<String, Object?> map) =>
      AppLocalizationsData(
        okLow: map['okLow']! as String,
        ok: map['ok']! as String,
        cancelLow: map['cancelLow']! as String,
        cancel: map['cancel']! as String,
        closeLow: map['closeLow']! as String,
        close: map['close']! as String,
        multiline: map['multiline']! as String,
        auth: AppLocalizationsDataAuth.fromJson(
            map['auth']! as Map<String, Object?>),
        plurals: AppLocalizationsDataPlurals.fromJson(
            map['plurals']! as Map<String, Object?>),
        templated: AppLocalizationsDataTemplated.fromJson(
            map['templated']! as Map<String, Object?>),
        dates: AppLocalizationsDataDates.fromJson(
            map['dates']! as Map<String, Object?>),
      );

  AppLocalizationsData copyWith({
    String? okLow,
    String? ok,
    String? cancelLow,
    String? cancel,
    String? closeLow,
    String? close,
    String? multiline,
    AppLocalizationsDataAuth? auth,
    AppLocalizationsDataPlurals? plurals,
    AppLocalizationsDataTemplated? templated,
    AppLocalizationsDataDates? dates,
  }) =>
      AppLocalizationsData(
        okLow: okLow ?? this.okLow,
        ok: ok ?? this.ok,
        cancelLow: cancelLow ?? this.cancelLow,
        cancel: cancel ?? this.cancel,
        closeLow: closeLow ?? this.closeLow,
        close: close ?? this.close,
        multiline: multiline ?? this.multiline,
        auth: auth ?? this.auth,
        plurals: plurals ?? this.plurals,
        templated: templated ?? this.templated,
        dates: dates ?? this.dates,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsData &&
          okLow == other.okLow &&
          ok == other.ok &&
          cancelLow == other.cancelLow &&
          cancel == other.cancel &&
          closeLow == other.closeLow &&
          close == other.close &&
          multiline == other.multiline &&
          auth == other.auth &&
          plurals == other.plurals &&
          templated == other.templated &&
          dates == other.dates);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      okLow.hashCode ^
      ok.hashCode ^
      cancelLow.hashCode ^
      cancel.hashCode ^
      closeLow.hashCode ^
      close.hashCode ^
      multiline.hashCode ^
      auth.hashCode ^
      plurals.hashCode ^
      templated.hashCode ^
      dates.hashCode;
}

class AppLocalizationsDataAuth {
  const AppLocalizationsDataAuth({
    required this.anonymously,
    required this.login,
  });

  final String anonymously;
  final String login;
  factory AppLocalizationsDataAuth.fromJson(Map<String, Object?> map) =>
      AppLocalizationsDataAuth(
        anonymously: map['anonymously']! as String,
        login: map['login']! as String,
      );

  AppLocalizationsDataAuth copyWith({
    String? anonymously,
    String? login,
  }) =>
      AppLocalizationsDataAuth(
        anonymously: anonymously ?? this.anonymously,
        login: login ?? this.login,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataAuth &&
          anonymously == other.anonymously &&
          login == other.login);
  @override
  int get hashCode =>
      runtimeType.hashCode ^ anonymously.hashCode ^ login.hashCode;
}

class AppLocalizationsDataPlurals {
  const AppLocalizationsDataPlurals({
    required String manMultiple,
    required String manOne,
    required String manZero,
  })  : _manMultiple = manMultiple,
        _manOne = manOne,
        _manZero = manZero;

  final String _manMultiple;
  final String _manOne;
  final String _manZero;

  String man({
    required Plural plural,
  }) {
    if (plural == Plural.multiple) {
      return _manMultiple;
    }
    if (plural == Plural.one) {
      return _manOne;
    }
    if (plural == Plural.zero) {
      return _manZero;
    }
    throw Exception();
  }

  factory AppLocalizationsDataPlurals.fromJson(Map<String, Object?> map) =>
      AppLocalizationsDataPlurals(
        manMultiple: map['manMultiple']! as String,
        manOne: map['manOne']! as String,
        manZero: map['manZero']! as String,
      );

  AppLocalizationsDataPlurals copyWith({
    String? manMultiple,
    String? manOne,
    String? manZero,
  }) =>
      AppLocalizationsDataPlurals(
        manMultiple: manMultiple ?? _manMultiple,
        manOne: manOne ?? _manOne,
        manZero: manZero ?? _manZero,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataPlurals &&
          _manMultiple == other._manMultiple &&
          _manOne == other._manOne &&
          _manZero == other._manZero);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      _manMultiple.hashCode ^
      _manOne.hashCode ^
      _manZero.hashCode;
}

class AppLocalizationsDataTemplated {
  const AppLocalizationsDataTemplated({
    required String contactFemale,
    required String contactMale,
    required String hello,
    required this.date,
    required this.numbers,
  })  : _contactFemale = contactFemale,
        _contactMale = contactMale,
        _hello = hello;

  final String _contactFemale;
  final String _contactMale;
  final String _hello;
  final AppLocalizationsDataTemplatedDate date;
  final AppLocalizationsDataTemplatedNumbers numbers;

  String contact({
    required Gender gender,
    required String lastName,
    String? locale,
  }) {
    if (gender == Gender.female) {
      return _contactFemale.insertTemplateValues(
        {
          'last_name': lastName,
        },
        locale: locale,
      );
    }
    if (gender == Gender.male) {
      return _contactMale.insertTemplateValues(
        {
          'last_name': lastName,
        },
        locale: locale,
      );
    }
    throw Exception();
  }

  String hello({
    required String firstName,
    String? locale,
  }) {
    return _hello.insertTemplateValues(
      {
        'first_name': firstName,
      },
      locale: locale,
    );
  }

  factory AppLocalizationsDataTemplated.fromJson(Map<String, Object?> map) =>
      AppLocalizationsDataTemplated(
        contactFemale: map['contactFemale']! as String,
        contactMale: map['contactMale']! as String,
        hello: map['hello']! as String,
        date: AppLocalizationsDataTemplatedDate.fromJson(
            map['date']! as Map<String, Object?>),
        numbers: AppLocalizationsDataTemplatedNumbers.fromJson(
            map['numbers']! as Map<String, Object?>),
      );

  AppLocalizationsDataTemplated copyWith({
    String? contactFemale,
    String? contactMale,
    String? hello,
    AppLocalizationsDataTemplatedDate? date,
    AppLocalizationsDataTemplatedNumbers? numbers,
  }) =>
      AppLocalizationsDataTemplated(
        contactFemale: contactFemale ?? _contactFemale,
        contactMale: contactMale ?? _contactMale,
        hello: hello ?? _hello,
        date: date ?? this.date,
        numbers: numbers ?? this.numbers,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataTemplated &&
          _contactFemale == other._contactFemale &&
          _contactMale == other._contactMale &&
          _hello == other._hello &&
          date == other.date &&
          numbers == other.numbers);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      _contactFemale.hashCode ^
      _contactMale.hashCode ^
      _hello.hashCode ^
      date.hashCode ^
      numbers.hashCode;
}

class AppLocalizationsDataTemplatedDate {
  const AppLocalizationsDataTemplatedDate({
    required String pattern,
    required String simple,
  })  : _pattern = pattern,
        _simple = simple;

  final String _pattern;
  final String _simple;

  String pattern({
    required DateTime date,
    String? locale,
  }) {
    return _pattern.insertTemplateValues(
      {
        'date': date,
      },
      locale: locale,
    );
  }

  String simple({
    required DateTime date,
    String? locale,
  }) {
    return _simple.insertTemplateValues(
      {
        'date': date,
      },
      locale: locale,
    );
  }

  factory AppLocalizationsDataTemplatedDate.fromJson(
          Map<String, Object?> map) =>
      AppLocalizationsDataTemplatedDate(
        pattern: map['pattern']! as String,
        simple: map['simple']! as String,
      );

  AppLocalizationsDataTemplatedDate copyWith({
    String? pattern,
    String? simple,
  }) =>
      AppLocalizationsDataTemplatedDate(
        pattern: pattern ?? _pattern,
        simple: simple ?? _simple,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataTemplatedDate &&
          _pattern == other._pattern &&
          _simple == other._simple);
  @override
  int get hashCode =>
      runtimeType.hashCode ^ _pattern.hashCode ^ _simple.hashCode;
}

class AppLocalizationsDataTemplatedNumbers {
  const AppLocalizationsDataTemplatedNumbers({
    required String formatted,
    required String simple,
    required String count,
  })  : _formatted = formatted,
        _simple = simple,
        _count = count;

  final String _formatted;
  final String _simple;
  final String _count;

  String formatted({
    required double price,
    String? locale,
  }) {
    return _formatted.insertTemplateValues(
      {
        'price': price,
      },
      locale: locale,
    );
  }

  String simple({
    required double price,
    String? locale,
  }) {
    return _simple.insertTemplateValues(
      {
        'price': price,
      },
      locale: locale,
    );
  }

  String count({
    required int count,
    String? locale,
  }) {
    return _count.insertTemplateValues(
      {
        'count': count,
      },
      locale: locale,
    );
  }

  factory AppLocalizationsDataTemplatedNumbers.fromJson(
          Map<String, Object?> map) =>
      AppLocalizationsDataTemplatedNumbers(
        formatted: map['formatted']! as String,
        simple: map['simple']! as String,
        count: map['count']! as String,
      );

  AppLocalizationsDataTemplatedNumbers copyWith({
    String? formatted,
    String? simple,
    String? count,
  }) =>
      AppLocalizationsDataTemplatedNumbers(
        formatted: formatted ?? _formatted,
        simple: simple ?? _simple,
        count: count ?? _count,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataTemplatedNumbers &&
          _formatted == other._formatted &&
          _simple == other._simple &&
          _count == other._count);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      _formatted.hashCode ^
      _simple.hashCode ^
      _count.hashCode;
}

class AppLocalizationsDataDates {
  const AppLocalizationsDataDates({
    required this.month,
    required this.weekday,
  });

  final AppLocalizationsDataDatesMonth month;
  final AppLocalizationsDataDatesWeekday weekday;
  factory AppLocalizationsDataDates.fromJson(Map<String, Object?> map) =>
      AppLocalizationsDataDates(
        month: AppLocalizationsDataDatesMonth.fromJson(
            map['month']! as Map<String, Object?>),
        weekday: AppLocalizationsDataDatesWeekday.fromJson(
            map['weekday']! as Map<String, Object?>),
      );

  AppLocalizationsDataDates copyWith({
    AppLocalizationsDataDatesMonth? month,
    AppLocalizationsDataDatesWeekday? weekday,
  }) =>
      AppLocalizationsDataDates(
        month: month ?? this.month,
        weekday: weekday ?? this.weekday,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataDates &&
          month == other.month &&
          weekday == other.weekday);
  @override
  int get hashCode => runtimeType.hashCode ^ month.hashCode ^ weekday.hashCode;
}

class AppLocalizationsDataDatesMonth {
  const AppLocalizationsDataDatesMonth({
    required this.april,
    required this.march,
    required this.february,
    required this.january,
  });

  final String april;
  final String march;
  final String february;
  final String january;
  factory AppLocalizationsDataDatesMonth.fromJson(Map<String, Object?> map) =>
      AppLocalizationsDataDatesMonth(
        april: map['april']! as String,
        march: map['march']! as String,
        february: map['february']! as String,
        january: map['january']! as String,
      );

  AppLocalizationsDataDatesMonth copyWith({
    String? april,
    String? march,
    String? february,
    String? january,
  }) =>
      AppLocalizationsDataDatesMonth(
        april: april ?? this.april,
        march: march ?? this.march,
        february: february ?? this.february,
        january: january ?? this.january,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataDatesMonth &&
          april == other.april &&
          march == other.march &&
          february == other.february &&
          january == other.january);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      april.hashCode ^
      march.hashCode ^
      february.hashCode ^
      january.hashCode;
}

class AppLocalizationsDataDatesWeekday {
  const AppLocalizationsDataDatesWeekday({
    required this.sunday,
    required this.saturday,
    required this.friday,
    required this.thursday,
    required this.wednesday,
    required this.tuesday,
    required this.monday,
  });

  final String sunday;
  final String saturday;
  final String friday;
  final String thursday;
  final String wednesday;
  final String tuesday;
  final String monday;
  factory AppLocalizationsDataDatesWeekday.fromJson(Map<String, Object?> map) =>
      AppLocalizationsDataDatesWeekday(
        sunday: map['sunday']! as String,
        saturday: map['saturday']! as String,
        friday: map['friday']! as String,
        thursday: map['thursday']! as String,
        wednesday: map['wednesday']! as String,
        tuesday: map['tuesday']! as String,
        monday: map['monday']! as String,
      );

  AppLocalizationsDataDatesWeekday copyWith({
    String? sunday,
    String? saturday,
    String? friday,
    String? thursday,
    String? wednesday,
    String? tuesday,
    String? monday,
  }) =>
      AppLocalizationsDataDatesWeekday(
        sunday: sunday ?? this.sunday,
        saturday: saturday ?? this.saturday,
        friday: friday ?? this.friday,
        thursday: thursday ?? this.thursday,
        wednesday: wednesday ?? this.wednesday,
        tuesday: tuesday ?? this.tuesday,
        monday: monday ?? this.monday,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataDatesWeekday &&
          sunday == other.sunday &&
          saturday == other.saturday &&
          friday == other.friday &&
          thursday == other.thursday &&
          wednesday == other.wednesday &&
          tuesday == other.tuesday &&
          monday == other.monday);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      sunday.hashCode ^
      saturday.hashCode ^
      friday.hashCode ^
      thursday.hashCode ^
      wednesday.hashCode ^
      tuesday.hashCode ^
      monday.hashCode;
}
