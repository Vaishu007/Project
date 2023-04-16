import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smit_project/admin/help_center.dart';
import 'package:smit_project/db_helper/dbHelper.dart';
import 'package:smit_project/gridWidget/help_center/help_center_controller.dart';


class HelpCenterAddPage extends StatefulWidget {
  const HelpCenterAddPage({Key? key}) : super(key: key);

  @override
  State<HelpCenterAddPage> createState() => _HelpCenterAddPageState();
}

class _HelpCenterAddPageState extends State<HelpCenterAddPage> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final HelpCenterController helpCenterController = Get.put(HelpCenterController());

  @override
  void initState() {
    super.initState();
    helpCenterController.dbHelper = DatabaseHelper.instance;
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
                      "Add Help Data",
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
                      controller: helpCenterController.nameCtrl,
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
                        helpCenterController.helpCenter.name = value;
                      },
                      validator: (value) {
                        return helpCenterController.validateName(value!);
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
                      controller: helpCenterController.phoneCtrl,
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
                        helpCenterController.helpCenter.phone = value;
                      },
                      validator: (value) {
                        return helpCenterController.validatePhone(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: helpCenterController.designationCtrl,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(color: Colors.red, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black54)),
                        labelText: "Designation",
                      ),
                      onSaved: (value) {
                        helpCenterController.helpCenter.designation = value;
                      },
                      validator: (value) {
                        return helpCenterController.validateDesignation(value!);
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
                      controller: helpCenterController.cityCtrl,
                      keyboardType: TextInputType.name,

                      decoration: InputDecoration(
                        counterText: '',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(color: Colors.red, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black54)),
                        labelText: "City",
                      ),
                      onSaved: (value) {
                        helpCenterController.helpCenter.city = value;
                      },
                      validator: (value) {
                        return helpCenterController.validateCity(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 130,
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.top,
                      textAlign: TextAlign.start,
                      controller: helpCenterController.zoneCtrl,
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
                          labelText: "Zone",
                          alignLabelWithHint: true),
                      onSaved: (value) {
                        helpCenterController.helpCenter.zone = value;
                      },
                      validator: (value) {
                        return helpCenterController.validateZone(value!);
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
                          form.save();
                          await helpCenterController.dbHelper!.insertHelpCenter(helpCenterController.helpCenter);
                          form.reset();
                          helpCenterController.nameCtrl.clear();
                          helpCenterController.phoneCtrl.clear();
                          helpCenterController.designationCtrl.clear();
                          helpCenterController.cityCtrl.clear();
                          helpCenterController.zoneCtrl.clear();
                          // Get.to(()=>LoginPage());
                          print("success");
                        }else{
                          print("error");
                        }

                      },
                      child: const Text('Add',style: TextStyle(fontSize: 20),)
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.to(() => AdminHelpCenter());
                      },
                      child: const Text('View',style: TextStyle(fontSize: 20),)
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: GestureDetector(
                  //     child: RichText(
                  //       text: TextSpan(
                  //           text: "Already have an Account? ",
                  //           style: TextStyle(
                  //               color: Colors.grey.shade700,
                  //               fontSize: 13,
                  //               fontWeight: FontWeight.bold),
                  //           children: const [
                  //             TextSpan(
                  //                 text: "Login",
                  //                 style: TextStyle(
                  //                     color: Colors.red,
                  //                     fontWeight: FontWeight.bold,
                  //                     fontSize: 13))
                  //           ]),
                  //     ),
                  //     onTap: () {
                  //       Get.to(()=>LoginPage());
                  //     },
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
