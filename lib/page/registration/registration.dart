import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smit_project/db_helper/dbHelper.dart';
import 'package:smit_project/page/registration/registration_controller.dart';
import '../Login/login.dart';


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final RegistrationController registrationController = Get.put(RegistrationController());

  @override
  void initState() {
    super.initState();
    registrationController.dbHelper = DatabaseHelper.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: registrationController.nameCtrl,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.red, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black54)),
                        labelText: "Name",
                      ),
                      onSaved: (value) {
                        registrationController.user.name = value;
                      },
                      validator: (value) {
                        return registrationController.validateName(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      maxLength: 10,
                      controller: registrationController.phoneCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterText: '',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.red, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black54)),
                        labelText: "Mobile No",
                      ),
                      onSaved: (value) {
                        registrationController.user.phone = value;
                      },
                      validator: (value) {
                        return registrationController.validatePhone(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: registrationController.emailCtrl,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.red, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black54)),
                        labelText: "Email",
                      ),
                      onSaved: (value) {
                        registrationController.user.email = value;
                      },
                      validator: (value) {
                        return registrationController.validateEmail(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      maxLength: 8,
                      controller: registrationController.passwordCtrl,
                      keyboardType: TextInputType.visiblePassword,

                      decoration: InputDecoration(
                        counterText: '',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.red, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black54)),
                        labelText: "Password",
                      ),
                      onSaved: (value) {
                        registrationController.user.password = value;
                      },
                      validator: (value) {
                        return registrationController.validatePassword(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: (registrationController.select.value ==
                                  "Male")
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        height: 54,
                        width: MediaQuery.of(context).size.width/2.3,
                        child: ElevatedButton.icon(
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(
                                  Colors.white)),
                          onPressed: () {
                            String value = "Male";
                            registrationController
                                .onClickRadioButton(value);
                            registrationController.update();

                          },
                          icon: Icon(
                            Icons.male,
                            size: 30,
                            color: (registrationController.select.value ==
                                "Male")
                                ? Colors.red
                                : Colors.grey,
                          ),
                          label: Text(
                            "Male",
                            style: TextStyle(
                                color: (registrationController.select.value ==
                                    "Male")
                                    ? Colors.red
                                    : Colors.grey),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: (registrationController.select.value ==
                                    "Female")
                                    ? Colors.red
                                    : Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        height: 54,
                        width: MediaQuery.of(context).size.width/2.3,
                        child: ElevatedButton.icon(
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(
                                  Colors.white)),
                          onPressed: () {
                            String value = "Female";
                            registrationController
                                .onClickRadioButton(value);
                            registrationController.update();

                          },
                          icon: Icon(
                            Icons.female,
                            size: 30,
                            color: (registrationController.select.value ==
                                "Female")
                                ? Colors.red
                                : Colors.grey,
                          ),
                          label: Text(
                            "Female",
                            style: TextStyle(
                                color: (registrationController.select.value ==
                                    "Female")
                                    ? Colors.red
                                    : Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 130,
                    child: TextFormField(
                      maxLines: 5,
                      textAlignVertical: TextAlignVertical.top,
                      textAlign: TextAlign.start,
                      controller: registrationController.addressCtrl,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.black54)),
                          labelText: "Address",
                          alignLabelWithHint: true),
                      onSaved: (value) {
                        registrationController.user.address = value;
                      },
                      validator: (value) {
                        return registrationController.validateAddress(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        var form = formKey.currentState;
                        if(form!.validate()){
                          registrationController.user.gender = registrationController.select.value;
                          form.save();
                          await registrationController.dbHelper!.insertUser(registrationController.user);
                          form.reset();
                          registrationController.nameCtrl.clear();
                          registrationController.phoneCtrl.clear();
                          registrationController.passwordCtrl.clear();
                          registrationController.emailCtrl.clear();
                          registrationController.addressCtrl.clear();
                          Get.to(()=>LoginPage());
                        }

                      },
                      child: const Text('Sign Up',style: TextStyle(fontSize: 20),)
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: RichText(
                        text: TextSpan(
                            text: "Already have an Account? ",
                            style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                            children: const [
                              TextSpan(
                                  text: "Login",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13))
                            ]),
                      ),
                      onTap: () {
                        Get.to(()=>LoginPage());
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
