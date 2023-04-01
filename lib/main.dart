import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smit_project/page/login.dart';

import 'bloc/loginBloc/login_bloc.dart';
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
      home: BlocProvider(create: (BuildContext context) => loginBLoc() ,
          child: const LoginPage()),
    );
  }
}
