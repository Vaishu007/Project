import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smit_project/Bottom/bottom.dart';
import 'package:smit_project/db_helper/dbHelper.dart';
import 'package:smit_project/page/profile/profile_controller.dart';
import 'package:smit_project/page/registration/registration_controller.dart';
import '../Login/login.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final ProfileController profileController = Get.put(ProfileController());
  int uId = 0;

  @override
  void initState() {
    super.initState();
    profileController.dbHelper = DatabaseHelper.instance;
    getUserData();
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
                   Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Profile".toUpperCase(),
                      style: const TextStyle(
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
                      controller: profileController.nameCtrl,
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
                        profileController.user.name = value;
                      },
                      validator: (value) {
                        return profileController.validateName(value!);
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
                      controller: profileController.phoneCtrl,
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
                        profileController.user.phone = value;
                      },
                      validator: (value) {
                        return profileController.validatePhone(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: profileController.emailCtrl,
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
                        profileController.user.email = value;
                      },
                      validator: (value) {
                        return profileController.validateEmail(value!);
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
                      controller: profileController.passwordCtrl,
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
                        profileController.user.password = value;
                      },
                      validator: (value) {
                        return profileController.validatePassword(value!);
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
                              color: (profileController.select.value ==
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
                            profileController
                                .onClickRadioButton(value);
                            profileController.update();

                          },
                          icon: Icon(
                            Icons.male,
                            size: 30,
                            color: (profileController.select.value ==
                                "Male")
                                ? Colors.red
                                : Colors.grey,
                          ),
                          label: Text(
                            "Male",
                            style: TextStyle(
                                color: (profileController.select.value ==
                                    "Male")
                                    ? Colors.red
                                    : Colors.grey),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: (profileController.select.value ==
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
                            profileController
                                .onClickRadioButton(value);
                            profileController.update();

                          },
                          icon: Icon(
                            Icons.female,
                            size: 30,
                            color: (profileController.select.value ==
                                "Female")
                                ? Colors.red
                                : Colors.grey,
                          ),
                          label: Text(
                            "Female",
                            style: TextStyle(
                                color: (profileController.select.value ==
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
                      controller: profileController.addressCtrl,
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
                        profileController.user.address = value;
                      },
                      validator: (value) {
                        return profileController.validateAddress(value!);
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
                          profileController.user.gender = profileController.select.value;
                          form.save();
                          if(uId != null) {
                            await profileController.dbHelper!.updateUser(
                                profileController.user);
                          }else{

                          }
                          form.reset();
                          profileController.nameCtrl.clear();
                          profileController.phoneCtrl.clear();
                          profileController.passwordCtrl.clear();
                          profileController.emailCtrl.clear();
                          profileController.addressCtrl.clear();
                          Get.snackbar("Updated", "",snackPosition: SnackPosition.BOTTOM,);
                          Get.offAll(()=>BottomNavPage());
                        }

                      },
                      child: Text('Update'.toUpperCase(),style: const TextStyle(fontSize: 20),)
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void getUserData() async{
    final SharedPreferences shared = await SharedPreferences.getInstance();
    String? id = shared.getString("user_id");

    uId = int.parse(id!);

    await profileController.dbHelper!.getUser(uId).then((value){
      if(value != null){
        profileController.user = value;
        profileController.nameCtrl.text = value.name!;
        profileController.phoneCtrl.text = value.phone!;
        profileController.emailCtrl.text = value.email!;
        profileController.passwordCtrl.text = value.password!;
        profileController.addressCtrl.text = value.address!;
        profileController.select.value = value.gender!;

        print(value.name);
      }
    }).onError((error, stackTrace){
      print(error.toString());
    });

  }
}
