import 'package:admin/Components/drawer/drawer.dart';
import 'package:admin/Components/serviceprovider_card.dart';
import 'package:admin/constats.dart';

import 'package:flutter/material.dart';

class ServiceProvider extends StatefulWidget {
  @override
  _ServiceProviderState createState() => _ServiceProviderState();
}

class _ServiceProviderState extends State<ServiceProvider> {
  @override
  Widget build(BuildContext context) {
    double kheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Provider'),
        backgroundColor: kPrimaryColor,
      ),
      body: Stack(children: <Widget>[
        Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage("images/BGI.JPEG"), fit: BoxFit.fill)),
        ),
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(height: kheight / 13),
                ServiceCard(),
              ],
            ),
          ),
        ),
      ]),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Drawerr(),
      ),
    );
  }
}
