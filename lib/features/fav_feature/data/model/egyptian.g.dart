// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../translation_feature/data/model/egyptian.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EgyptianAdapter extends TypeAdapter<Egyptian> {
  @override
  final int typeId = 2;

  @override
  Egyptian read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Egyptian(
      word: fields[0] as String?,
      symbol: fields[1] as String?,
      transliteration: fields[2] as String?,
      hieroglyphics: (fields[3] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Egyptian obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.word)
      ..writeByte(1)
      ..write(obj.symbol)
      ..writeByte(2)
      ..write(obj.transliteration)
      ..writeByte(3)
      ..write(obj.hieroglyphics);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EgyptianAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
