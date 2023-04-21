// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_branding_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BusinessBrandingModelAdapter extends TypeAdapter<BusinessBrandingModel> {
  @override
  final int typeId = 1;

  @override
  BusinessBrandingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BusinessBrandingModel(
      image: fields[0] as Uint8List,
      website: fields[2] as String,
      address: fields[6] as String,
      name: fields[1] as String,
      contactNumber: fields[3] as String,
      emailId: fields[4] as String,
      dateTime: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BusinessBrandingModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.website)
      ..writeByte(3)
      ..write(obj.contactNumber)
      ..writeByte(4)
      ..write(obj.emailId)
      ..writeByte(5)
      ..write(obj.dateTime)
      ..writeByte(6)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BusinessBrandingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
