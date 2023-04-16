import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'death_details/Death_details.dart';
class DeathList extends StatefulWidget {
  const DeathList({Key? key}) : super(key: key);

  @override
  State<DeathList> createState() => _DeathListState();
}

class _DeathListState extends State<DeathList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Page Title',
          style:TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: InkWell(
                onTap: () async {
                  Get.to(()=>Death_details());
                },
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            'https://picsum.photos/seed/305/600',
                            width: 80,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style:TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 20
                            ),
                          ),
                          Text(
                            'Date',

                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },

        ),
      ),
    );

  }
}
