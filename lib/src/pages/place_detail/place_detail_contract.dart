enum Mode {
  DEFAULT,
  SELECT,
}

enum Parameters {
  PLACE_ID,
}

extension ParametersExtension on Parameters {
  String get value {
    switch (this) {
      case Parameters.PLACE_ID:
        return 'PLACE_ID';
    }
  }
}