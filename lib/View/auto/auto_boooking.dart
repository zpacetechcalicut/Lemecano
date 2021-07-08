import 'package:admin/View/auto/viewAuto_booking.dart';

import 'package:admin/Components/drawer/drawer.dart';

import 'package:admin/constats.dart';
import 'package:flutter/material.dart';

import 'createAuto_booking.dart';

class AutoService extends StatefulWidget {
  @override
  _AutoServiceState createState() => _AutoServiceState();
}

class _AutoServiceState extends State<AutoService> {
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
                      text: "View Auto",
                    ),
                    Tab(
                      text: "Create Auto",
                    ),
                  ],
                ),
                title: Text('Auto Service'),
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
                    ViewAutoBooking(),
                    AutoForm(),
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
