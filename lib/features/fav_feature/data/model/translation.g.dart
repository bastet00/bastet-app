// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../translation_feature/data/model/translation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TranslationAdapter extends TypeAdapter<Translation> {
  @override
  final int typeId = 0;

  @override
  Translation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Translation(
      id: fields[0] as String?,
      arabic: (fields[1] as List?)?.cast<Arabic>(),
      egyptian: (fields[2] as List?)?.cast<Egyptian>(),
      english: (fields[3] as List?)?.cast<English>(),
    );
  }

  @override
  void write(BinaryWriter writer, Translation obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.arabic)
      ..writeByte(2)
      ..write(obj.egyptian)
      ..writeByte(3)
      ..write(obj.english);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
