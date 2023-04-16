import 'package:flutter/material.dart';
import 'package:smit_project/admin/screens/help_center.dart';

import '../screens/death_notes/deth_notes_add.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  Map arr= {
    'arrText':[
      'Bio-data',
      'Family',
      'Gallery',
      'Pride of society',
      'Society',
      'Help center',
      'Death note',
      'News'
    ],
    'arrIcon':[
      Icons.file_present,
      Icons.family_restroom,
      Icons.image,
      Icons.favorite,
      Icons.badge,
      Icons.help_center,
      Icons.info,
      Icons.file_copy_outlined
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          top: true,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: GridView.count(
                  padding: const EdgeInsets.all(10),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,

                  crossAxisCount: 3,
                  children: List.generate(
                    arr['arrText'].length,
                        (index) => GestureDetector(
                      onTap: () {
                        switch(arr['arrText'][index]){
                          // case 'Pride of society':
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => const POfS(),));
                          //   break;
                          case 'Death note':
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminDeathAdd(),));
                            break;
                          // case 'Bio-data':
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => const Bio(),));
                          //   break;
                          case 'Help center':
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminHelpCenter(),));
                            break;
                          // case 'News':
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => const NewsPage(),));
                          //   break;
                          // case 'Gallery':
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => const Gallery(),));
                          //   break;
                        }
                      },
                      child: Card(elevation: 10,
                        color: const Color(0xFFFB6969),
                        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10) ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(arr['arrIcon'][index],size: 20,color: Colors.white,),
                            ),
                            Text(arr['arrText'][index],textAlign: TextAlign.center,style: const TextStyle(color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );

  }
}
