import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smit_project/db_helper/dbHelper.dart';

class LoginController extends GetxController{

  TextEditingController contactController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var passwordVisible = true.obs;
  var phone = "".obs;
  var password = "".obs;
  DatabaseHelper? dbHelper;


  @override
  void onInit() {
    super.onInit();
    contactController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    contactController.dispose();
    passwordController.dispose();
  }

  String? validPhone(String value){
    if (value.length < 10) {
      return "Enter valid number";
    }
    return null;
  }
  String? validPassword(String value) {
    if (value.length < 8) {
      return "Enter 8 digit password";
    }
    return null;
  }
}