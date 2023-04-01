import 'package:flutter/material.dart';

import '../Tab/boy.dart';
import '../Tab/girl.dart';

class MerrigePage extends StatefulWidget {
  const MerrigePage({Key? key}) : super(key: key);

  @override
  State<MerrigePage> createState() => _MerrigePageState();
}

class _MerrigePageState extends State<MerrigePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: Text('Intrested Pepole'),
            bottom: TabBar(
                labelColor: Colors.redAccent,
                unselectedLabelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Colors.white),
                tabs: [
                  Tab(
                    text: 'Girl',
                  ),
                  Tab(
                    text: 'Boy',
                  )
                ],
                automaticIndicatorColorAdjustment: true,
                indicatorColor: Colors.yellow.shade300),
          ),
          body: TabBarView(
            children: [Girl(), Boy()],
          ),
        ));
  }
}
