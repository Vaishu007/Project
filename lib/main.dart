import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smit_project/page/Login/login.dart';
import 'package:smit_project/page/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen()
    );
  }
}
