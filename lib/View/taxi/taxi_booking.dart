import 'package:admin/View/taxi/createTaxi_booking.dart';
import 'package:admin/Components/drawer/drawer.dart';
import 'package:admin/View/taxi/viewTaxi_booking.dart';

import 'package:admin/constats.dart';
import 'package:flutter/material.dart';

class TaxiService extends StatefulWidget {
  @override
  _TaxiServiceState createState() => _TaxiServiceState();
}

class _TaxiServiceState extends State<TaxiService> {
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
                      text: "View Taxi",
                    ),
                    Tab(
                      text: "Create Taxi",
                    ),
                  ],
                ),
                title: Text('Taxi Service'),
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
                    ViewTaxiBooking(),
                    TaxiForm(),
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
