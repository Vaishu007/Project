import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smit_project/gridWidget/biodata/bio_controller.dart';

class AddBioData extends StatefulWidget {
  const AddBioData({Key? key}) : super(key: key);

  @override
  State<AddBioData> createState() => _AddBioDataState();
}

class _AddBioDataState extends State<AddBioData> {
  
  final BioController bioController=Get.put(BioController());
  bool isShani=false;
  bool isMangal=false;
  bool isMartiual=false;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                CircleAvatar(
                  child: Container(
                    child: const Text("Add Image"),
                  ),
                  radius: 50,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(width: 1, color: Colors.red)),
                        labelText: "Name",
                        hintText: "Enter Name"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(width: 1, color: Colors.red)),
                        labelText: "Father Name",
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(width: 1, color: Colors.red)),
                        labelText: "Mother Name",
                        hintText: "Enter Mother Name"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(width: 1, color: Colors.red)),
                        labelText: "Mobile no.",
                        hintText: "Enter Mobile Number"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(width: 1, color: Colors.red)),
                        labelText: "Email",
                        hintText: "Enter Email Address"),
                  ),
                ),
                 Obx(() =>  Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: (bioController.select.value ==
                                    "Male")
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          height: 54,
                          width: 151,
                          child: ElevatedButton.icon(
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(
                                    Colors.white)),
                            onPressed: () {
                              String value = "Male";
                              bioController
                                  .onClickRadioButton(value);
                              bioController.update();
                              // setState(() {
                              //   gender = value;
                              // });
                            },
                            icon: Icon(
                              Icons.male,
                              size: 30,
                              color: (bioController.select.value ==
                                  "Male")
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                            label: Text(
                              "Male",
                              style: TextStyle(
                                  color: (bioController.select.value ==
                                      "Male")
                                      ? Colors.red
                                      : Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: (bioController.select.value ==
                                      "Female")
                                      ? Colors.red
                                      : Colors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          height: 54,
                          width: 151,
                          child: ElevatedButton.icon(
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(
                                    Colors.white)),
                            onPressed: () {
                              String value = "Female";
                              bioController
                                  .onClickRadioButton(value);
                              bioController.update();
                              // setState(() {
                              //   gender = value;
                              // });
                            },
                            icon: Icon(
                              Icons.female,
                              size: 30,
                              color: (bioController.select.value ==
                                  "Female")
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                            label: Text(
                              "Female",
                              style: TextStyle(
                                  color: (bioController.select.value ==
                                      "Female")
                                      ? Colors.red
                                      : Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                 )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/2.3,
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(width: 1, color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                  BorderSide(width: 1, color: Colors.red)),
                              labelText: "Height",
                              ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/2.3,
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(width: 1, color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                  BorderSide(width: 1, color: Colors.red)),
                              labelText: "Weight",
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/2.3,
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(width: 1, color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                  BorderSide(width: 1, color: Colors.red)),
                              labelText: "Birth Date",
                              ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/2.3,
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(width: 1, color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                  BorderSide(width: 1, color: Colors.red)),
                              labelText: "Birth Time",
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(width: 1, color: Colors.red)),
                        labelText: "Birth Place",
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(width: 1, color: Colors.red)),
                        labelText: "Vatan",
                        hintText: "Enter Vatan Name"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(width: 1, color: Colors.red)),
                        labelText: "Moshal",
                        hintText: "Enter Moshal Name"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(width: 1, color: Colors.red)),
                        labelText: "Gotra",
                        hintText: "Enter Gotra Name"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(width: 1, color: Colors.red)),
                      labelText: "Mother Gotra",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Text("Shani"),
                     Switch(value: isShani, onChanged: (value) {
                       setState(() {
                         isShani=value;
                       });
                     },),
                      const SizedBox(
                        width: 20,
                      ),
                      Text("Mangal"),
                      Switch(value: isMangal, onChanged: (value) {
                        setState(() {
                          isMangal=value;
                        });
                      },)
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(width: 1, color: Colors.red)),
                      labelText: "Education",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(width: 1, color: Colors.red)),
                      labelText: "Occupation",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(width: 1, color: Colors.red)),
                      labelText: "Address",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(width: 1, color: Colors.red)),
                      labelText: "Designation",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(width: 1, color: Colors.red)),
                      labelText: "Income",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Merried"),
                      Switch(value: isMartiual, onChanged: (value) {
                        setState(() {
                          isMartiual=value;
                        });
                      },),

                    ],
                  ),
                ),

                ElevatedButton(onPressed: () {}, child: const Text("Submit")),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
