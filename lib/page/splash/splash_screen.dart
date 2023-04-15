import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smit_project/Bottom/bottom.dart';
import 'package:smit_project/page/Login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Welcome",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  void whereToGo() async {
    var pref = await SharedPreferences.getInstance();

    var login = pref.getBool("is_log");

    Timer(const Duration(seconds: 5), () {
      if (login != null) {
        if (login) {
          Get.offAll(() => const BottomNavPage());
        } else {
          Get.offAll(() => const LoginPage());
        }
      } else {
        Get.offAll(() => const LoginPage());
      }
    });
  }
}
