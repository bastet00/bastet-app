// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../translation_feature/data/model/arabic.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArabicAdapter extends TypeAdapter<Arabic> {
  @override
  final int typeId = 1;

  @override
  Arabic read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Arabic(
      word: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Arabic obj) {
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
      other is ArabicAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
