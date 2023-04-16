import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smit_project/db_helper/dbHelper.dart';
import 'package:smit_project/gridWidget/help_center/help_center_controller.dart';

import '../../model/help_center_model.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {

  final HelpCenterController helpCenterController = Get.put(HelpCenterController());

  @override
  void initState() {
    super.initState();
    helpCenterController.dbHelper = DatabaseHelper.instance;
    helpCenterController.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Help Center"),
        ),
        body: Obx(() {
          return ListView.builder(
            itemCount: helpCenterController.helpData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [Text("Name :"), Text(" ${helpCenterController.helpData.value[index].name}",)],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [Text("Mobile no. :"), Text(" ${helpCenterController.helpData[index].phone}")],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [Text("Designation :"), Text(" ${helpCenterController.helpData[index].designation}")],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [Text("City :"), Text(" ${helpCenterController.helpData[index].city}")],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [Text("Zone :"), Text(" ${helpCenterController.helpData[index].zone}")],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }

        )
    );
  }

}
