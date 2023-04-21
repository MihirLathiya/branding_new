import 'dart:convert';
import 'dart:io';

import 'package:branding/prefrence_manager/prefrence.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PersonalDataFormController extends GetxController {
  final picker = ImagePicker();
  Uint8List? imageBytes;
  String? base64String;
  File? imageFile;

  Future getImage() async {
    base64String = null;
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageBytes = await pickedFile.readAsBytes();
      base64String = base64.encode(imageBytes!);
      imageFile = File(pickedFile.path);
    }
    update();
  }
}

class BusinessDataFormController extends GetxController {
  final picker = ImagePicker();
  Uint8List? imageBytes;
  String? base64String;
  File? imageFile;

  Future getImage() async {
    base64String = null;
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageBytes = await pickedFile.readAsBytes();
      base64String = base64.encode(imageBytes!);
      imageFile = File(pickedFile.path);
    }
    update();
  }
}

class ShowDataController extends GetxController {
  int brand = 1;
  int brandSelect = -1;
  int privateSelect = -1;
  @override
  void onInit() {
    print('---------');
    brandSelect = PreferenceManager.getBrandIndex() == null ||
            PreferenceManager.getBrandIndex().toString() == 'null' ||
            PreferenceManager.getBrandIndex().toString() == ''
        ? -1
        : PreferenceManager.getBrandIndex();
    privateSelect = PreferenceManager.getPrivateIndex() == null ||
            PreferenceManager.getPrivateIndex().toString() == 'null' ||
            PreferenceManager.getPrivateIndex().toString() == ''
        ? -1
        : PreferenceManager.getPrivateIndex();
    super.onInit();
  }

  setBrand({required value}) {
    brand = value;
    print('Brand selected == $brand');
    update();
  }

  setBrandSelect({required value}) {
    setPrivateZero();
    brandSelect = value;
    print('Brand selected == $brand');
    update();
  }

  setBrandZero() {
    brandSelect = -1;
    update();
  }

  setPrivateZero() {
    privateSelect = -1;
    update();
  }

  setPrivateSelect({required value}) {
    setBrandZero();
    privateSelect = value;
    print('Brand selected == $brand');
    update();
  }
}

class BusinessDataEditController extends GetxController {
  final picker = ImagePicker();
  Uint8List? imageBytes;
  String? base64String;
  File? imageFile;

  Future getImage() async {
    base64String = null;
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageBytes = await pickedFile.readAsBytes();
      base64String = base64.encode(imageBytes!);
      imageFile = File(pickedFile.path);
    }
    update();
  }
}

class PersonalDataEditController extends GetxController {
  TextEditingController pNameController = TextEditingController();
  TextEditingController pContactNumberController = TextEditingController();
  TextEditingController pEmailIdController = TextEditingController();
  TextEditingController pOccupationController = TextEditingController();
  final picker = ImagePicker();
  Uint8List? imageBytes;
  String? base64String;
  File? imageFile;

  Future getImage() async {
    base64String = null;
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageBytes = await pickedFile.readAsBytes();
      base64String = base64.encode(imageBytes!);
      imageFile = File(pickedFile.path);
    }
    update();
  }

  textFiledListener() {
    pNameController.addListener(() {
      update();
    });
    pContactNumberController.addListener(() {
      update();
    });
    pEmailIdController.addListener(() {
      update();
    });
    pOccupationController.addListener(() {
      update();
    });
  } 

  @override
  void onInit() {
    textFiledListener();
    super.onInit();
  }
}
