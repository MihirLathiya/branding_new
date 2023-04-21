import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

part 'download.g.dart';

@HiveType(typeId: 2)
class DownloadImageModel extends HiveObject {
  @HiveField(0)
  final Uint8List imageDownload;

  @HiveField(1)
  final String dateTimeDownload;

  DownloadImageModel(
      {required this.imageDownload, required this.dateTimeDownload});
}
