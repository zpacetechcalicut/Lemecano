import 'package:admin/View/crain/createCrain_booking.dart';
import 'package:admin/View/crain/viewCrain_booking.dart';

import 'package:admin/Components/drawer/drawer.dart';

import 'package:admin/constats.dart';
import 'package:flutter/material.dart';

class CrainService extends StatefulWidget {
  @override
  _CrainServiceState createState() => _CrainServiceState();
}

class _CrainServiceState extends State<CrainService> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  indicatorColor: kPrimaryLightColor,
                  tabs: [
                    Tab(
                      text: "View Crane",
                    ),
                    Tab(
                      text: "Create Crane",
                    ),
                  ],
                ),
                title: Text('Crane Service'),
                backgroundColor: kPrimaryColor,
              ),
              body: Stack(children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: AssetImage("images/BGI.JPEG"),
                          fit: BoxFit.fill)),
                ),
                TabBarView(
                  children: [
                    ViewCrainBooking(),
                    CrainForm(),
                  ],
                ),
              ]),
              drawer: Drawer(
                // Add a ListView to the drawer. This ensures the user can scroll
                // through the options in the drawer if there isn't enough vertical
                // space to fit everything.
                child: Drawerr(),
              )),
        ));
  }
}
