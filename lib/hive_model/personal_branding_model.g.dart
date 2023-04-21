// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_branding_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonalBrandingModelAdapter extends TypeAdapter<PersonalBrandingModel> {
  @override
  final int typeId = 0;

  @override
  PersonalBrandingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonalBrandingModel(
      image: fields[0] as Uint8List,
      name: fields[1] as String,
      occupation: fields[2] as String,
      contactNumber: fields[3] as String,
      emailId: fields[4] as String,
      dateTime: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PersonalBrandingModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.occupation)
      ..writeByte(3)
      ..write(obj.contactNumber)
      ..writeByte(4)
      ..write(obj.emailId)
      ..writeByte(5)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonalBrandingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
