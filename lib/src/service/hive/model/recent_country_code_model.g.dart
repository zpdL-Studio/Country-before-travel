// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_country_code_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecentCountryCodeModelAdapter
    extends TypeAdapter<RecentCountryCodeModel> {
  @override
  final int typeId = 1;

  @override
  RecentCountryCodeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecentCountryCodeModel(
      name: fields[0] == null ? '' : fields[0] as String,
      code: fields[1] == null ? '' : fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RecentCountryCodeModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.code);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentCountryCodeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
