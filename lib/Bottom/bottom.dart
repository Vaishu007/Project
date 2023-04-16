import 'package:flutter/material.dart';
import 'package:smit_project/admin/help_center%20add.dart';

import '../page/home.dart';
import '../page/merrige.dart';
import '../page/notification.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({Key? key}) : super(key: key);

  @override
  State<BottomNavPage> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNavPage> {
  var current=1;
  final screens=[
    NotificationPage(),
    HomePage(),
    MerrigePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: current,
        children: screens,),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.red,
        unselectedItemColor: Colors.white54,
        showUnselectedLabels: false,
        selectedItemColor: Colors.yellow.shade300,
        currentIndex: current,
        elevation: 30,
        onTap: (index)=>setState(() => current=index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notification'),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home'),

          BottomNavigationBarItem(
              icon: Icon(Icons.handshake),
              label: 'Merrige'),

        ],),
    );
  }
}
