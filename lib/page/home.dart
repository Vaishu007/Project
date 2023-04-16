import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smit_project/admin/home_page/admin_home.dart';
import 'package:smit_project/admin/screens/help_center%20add.dart';
import 'package:smit_project/gridWidget/gallery.dart';
import 'package:smit_project/page/Login/login.dart';
import 'package:smit_project/page/profile/profile_page.dart';


import '../gridWidget/biodata/Biodata_add.dart';
import '../gridWidget/death_list.dart';
import '../gridWidget/help_center/help_center.dart';
import '../gridWidget/news.dart';
import '../gridWidget/pos.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> imageSliders = imgList
      .map((item) => Container(
        margin: const EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(item, fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                  ),
                )
              ],
            )),
      ))
      .toList();
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
        appBar: AppBar(
          title: const Text('Home'),
          // in action widget we have PopupMenuButton
          actions: [
            PopupMenuButton<int>(
              itemBuilder: (context) => [
                // PopupMenuItem 1
                const PopupMenuItem(
                  value: 1,
                  // row with 2 children
                  child: Text("Profile"),
                ),
                const PopupMenuItem(
                  value: 2,
                  // row with two children
                  child: Text("Admin"),
                ),
                const PopupMenuItem(
                  value: 3,
                  // row with two children
                  child: Text("Log Out"),
                ),
              ],
              offset: const Offset(0, 50),
              elevation: 2,
              // on selected we show the dialog box
              onSelected: (value) {
                // if value 1 show dialog
                if (value == 1) {
                  Get.to(()=>const ProfilePage());
                  // if value 2 show dialog
                } else if (value == 3) {
                  logOut();
                }else if(value == 2){
                  Get.to(()=> const AdminHome());
                }
              },
            ),
          ],
        ),


        body: SafeArea(
          top: true,
          child: Column(
            children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: false,
            ),
            items: imageSliders,
          ),
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
                     case 'Pride of society':
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const POfS(),));
                       break;
                     case 'Death note':
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const DeathList(),));
                       break;
                     case 'Bio-data':
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const Bio(),));
                       break;
                     case 'Help center':
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpCenter(),));
                       break;
                     case 'News':
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const NewsPage(),));
                       break;
                     case 'Gallery':
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const Gallery(),));
                       break;
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
        ));
  }

  void logOut() async{
    final SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setBool("is_log", false);
    Get.offAll(()=>const LoginPage());
  }
}
