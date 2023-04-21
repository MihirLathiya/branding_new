// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DownloadImageModelAdapter extends TypeAdapter<DownloadImageModel> {
  @override
  final int typeId = 2;

  @override
  DownloadImageModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DownloadImageModel(
      imageDownload: fields[0] as Uint8List,
      dateTimeDownload: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DownloadImageModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.imageDownload)
      ..writeByte(1)
      ..write(obj.dateTimeDownload);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DownloadImageModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
