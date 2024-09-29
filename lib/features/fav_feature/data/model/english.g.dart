// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../translation_feature/data/model/english.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EnglishAdapter extends TypeAdapter<English> {
  @override
  final int typeId = 3;

  @override
  English read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return English(
      word: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, English obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.word);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnglishAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
