import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smit_project/db_helper/dbHelper.dart';
import 'package:smit_project/model/user_model.dart';

class RegistrationController extends GetxController {

  late TextEditingController nameCtrl = TextEditingController();
  late TextEditingController addressCtrl = TextEditingController();
  late TextEditingController emailCtrl = TextEditingController();
  late TextEditingController phoneCtrl = TextEditingController();
  late TextEditingController passwordCtrl = TextEditingController();

  DatabaseHelper? dbHelper;
  final User user = User();


  late String selectedGender;
  late var select = "".obs;

  void onClickRadioButton(value) {
    print(value);
    select.value = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();


    nameCtrl = TextEditingController();
    addressCtrl = TextEditingController();
    emailCtrl = TextEditingController();
    phoneCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();

    nameCtrl.dispose();
    addressCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    passwordCtrl.dispose();

  }


  String? validateName(String value) {
    if (value == "" && value.isEmpty) {
      return "Enter Name";
    }
    return null;
  }

  String? validateClg(String value) {
    if (value == "" && value.isEmpty) {
      return "Enter Collage Name";
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value == "" && value.isEmpty) {
      return "Enter Address";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value == "" && value.isEmpty) {
      return "Enter Email";
    }
    return null;
  }

  String? validatePhone(String value) {
    if (value.length < 10) {
      return "Enter valid number";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 8) {
      return "Enter 8 digit password";
    }
    return null;
  }
}
