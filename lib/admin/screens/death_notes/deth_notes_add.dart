import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smit_project/admin/screens/death_notes/death_details.dart';
import 'package:smit_project/gridWidget/death_details/death_details_controller.dart';

class AdminDeathAdd extends StatefulWidget {
  const AdminDeathAdd({Key? key}) : super(key: key);

  @override
  State<AdminDeathAdd> createState() => _AdminDeathAddState();
}

class _AdminDeathAddState extends State<AdminDeathAdd> {
  final DeathDetailController deathDetailController = Get.put(DeathDetailController());
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add"),),
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
                      controller: deathDetailController.nameCtrl,
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
                        deathDetailController.helpCenter.name = value;
                      },
                      validator: (value) {
                        return deathDetailController.validateName(value!);
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
                      controller: deathDetailController.phoneCtrl,
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
                        deathDetailController.helpCenter.phone = value;
                      },
                      validator: (value) {
                        return deathDetailController.validatePhone(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: deathDetailController.designationCtrl,
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
                        deathDetailController.helpCenter.designation = value;
                      },
                      validator: (value) {
                        return deathDetailController.validateDesignation(value!);
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
                      controller: deathDetailController.cityCtrl,
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
                        deathDetailController.helpCenter.city = value;
                      },
                      validator: (value) {
                        return deathDetailController.validateCity(value!);
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
                      controller: deathDetailController.zoneCtrl,
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
                        deathDetailController.helpCenter.zone = value;
                      },
                      validator: (value) {
                        return deathDetailController.validateZone(value!);
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
                          await deathDetailController.dbHelper!.insertHelpCenter(deathDetailController.helpCenter);
                          form.reset();
                          deathDetailController.nameCtrl.clear();
                          deathDetailController.phoneCtrl.clear();
                          deathDetailController.designationCtrl.clear();
                          deathDetailController.cityCtrl.clear();
                          deathDetailController.zoneCtrl.clear();
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
                        Get.to(() => AdminDeathDetails());
                      },
                      child: const Text('View',style: TextStyle(fontSize: 20),)
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
