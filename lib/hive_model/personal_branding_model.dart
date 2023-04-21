import 'dart:io';

import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

part 'personal_branding_model.g.dart';

// flutter packages pub run build_runner build
@HiveType(typeId: 0)
class PersonalBrandingModel extends HiveObject {
  @HiveField(0)
  final Uint8List image;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String occupation;

  @HiveField(3)
  final String contactNumber;

  @HiveField(4)
  final String emailId;

  @HiveField(5)
  final String dateTime;

  PersonalBrandingModel(
      {required this.image,
      required this.name,
      required this.occupation,
      required this.contactNumber,
      required this.emailId,
      required this.dateTime});
}
