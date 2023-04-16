import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smit_project/db_helper/dbHelper.dart';
import 'package:smit_project/model/help_center_model.dart';

class DeathDetailController extends GetxController {
  late TextEditingController nameCtrl = TextEditingController();
  late TextEditingController phoneCtrl = TextEditingController();
  late TextEditingController designationCtrl = TextEditingController();
  late TextEditingController cityCtrl = TextEditingController();
  late TextEditingController zoneCtrl = TextEditingController();

  DatabaseHelper? dbHelper;
  final HelpCenterModel helpCenter = HelpCenterModel();
  RxList helpData = [].obs;

  @override
  void onInit() {
    super.onInit();

    nameCtrl = TextEditingController();
    phoneCtrl = TextEditingController();
    designationCtrl = TextEditingController();
    cityCtrl = TextEditingController();
    zoneCtrl = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    nameCtrl.dispose();
    phoneCtrl.dispose();
    designationCtrl.dispose();
    cityCtrl.dispose();
    zoneCtrl.dispose();
  }

  String? validateName(String value) {
    if (value == "" && value.isEmpty) {
      return "Enter Name";
    }
    return null;
  }

  String? validatePhone(String value) {
    if (value.length < 10) {
      return "Enter valid number";
    }
    return null;
  }

  String? validateDesignation(String value) {
    if (value == "" && value.isEmpty) {
      return "Enter Designation";
    }
    return null;
  }

  String? validateCity(String value) {
    if (value == "" && value.isEmpty) {
      return "Enter City";
    }
    return null;
  }

  String? validateZone(String value) {
    if (value == "" && value.isEmpty) {
      return "Enter Zone";
    }
    return null;
  }

  void getData() async {
    await dbHelper!.getHelpData().then((value) {
      helpData.value = value;
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }
}
