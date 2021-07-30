enum Parameters {
  ID,
}

extension ParametersExtension on Parameters {
  String get value {
    switch (this) {
      case Parameters.ID:
        return 'ID';
    }
  }
}

Map<String, String>? tripPlannerParameters({String? id}) {
  if(id != null) {
    return {
      Parameters.ID.value: id
    };
  }
  return null;
}