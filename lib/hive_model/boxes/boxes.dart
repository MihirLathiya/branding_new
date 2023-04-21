import 'package:branding/constant/constant.dart';
import 'package:branding/hive_model/business_branding_model.dart';
import 'package:branding/hive_model/download.dart';
import 'package:branding/hive_model/personal_branding_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<PersonalBrandingModel> getPersonalData() =>
      Hive.box<PersonalBrandingModel>(AppConstant.personalDataBoxName);
  static Box<BusinessBrandingModel> getBusinessData() =>
      Hive.box<BusinessBrandingModel>(AppConstant.businessDataBoxName);
  static Box<DownloadImageModel> getDownloadData() =>
      Hive.box<DownloadImageModel>(AppConstant.downloadDataBoxName);
}
