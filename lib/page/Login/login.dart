import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smit_project/db_helper/dbHelper.dart';
import 'package:smit_project/page/Login/login_controller.dart';
import 'package:smit_project/page/registration/registration.dart';

import '../../Bottom/bottom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  final LoginController loginController = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    loginController.dbHelper = DatabaseHelper.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 5,
              color: Colors.red.shade50,
              shadowColor: Colors.red[300],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'LOGIN',
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          maxLength: 10,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.phone,
                          controller: loginController.contactController,
                          decoration: InputDecoration(
                            counterText: '',
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                    color: Colors.red, width: 2)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: Colors.black38),
                            ),
                            contentPadding: const EdgeInsets.all(10),
                            labelText: "Mobile No",
                          ),
                          onSaved: (value) {
                            loginController.phone.value = value!;
                          },
                          validator: (value) {
                            return loginController.validPhone(value!);
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          maxLength: 8,
                          obscureText: loginController.passwordVisible.value,
                          obscuringCharacter: "*",
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.visiblePassword,
                          controller: loginController.passwordController,
                          decoration: InputDecoration(
                            counterText: '',
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red.shade900),
                                borderRadius: BorderRadius.circular(5)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black38),
                                borderRadius: BorderRadius.circular(5)),
                            contentPadding: const EdgeInsets.all(10),
                            labelText: "Password",
                            suffixIcon: IconButton(
                                onPressed: () {
                                  loginController.passwordVisible.value =
                                      loginController.passwordVisible.value ==
                                              true
                                          ? false
                                          : true;
                                },
                                icon: loginController.passwordVisible.value
                                    ? const Icon(
                                        Icons.visibility,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.visibility_off,
                                        color: Colors.grey,
                                      )),
                          ),
                          onSaved: (value) {
                            loginController.password.value = value!;
                          },
                          validator: (value) {
                            return loginController.validPassword(value!);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          child: ElevatedButton(
                            onPressed: () async {
                              var form = formKey.currentState;
                              if (form!.validate()) {
                                form.save();

                                await loginController.dbHelper!
                                    .loginUser(loginController.phone.value,
                                        loginController.password.value)
                                    .then((value) {
                                  if (value != null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text("Login Successfull"),
                                          backgroundColor: Colors.green,
                                        ));
                                    Get.offAll(() => BottomNavPage());
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Please Check Username and Password")));
                                  }
                                }).onError((error, stackTrace) {
                                  print(error.toString());
                                });
                                form.reset();
                                loginController.contactController.clear();
                                loginController.passwordController.clear();
                              }
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            child: RichText(
                              text: TextSpan(
                                  text: "Don't Have an Account? ",
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                  children: const [
                                    TextSpan(
                                        text: "Sign Up",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13))
                                  ]),
                            ),
                            onTap: () {
                              Get.to(() => RegistrationPage());
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
