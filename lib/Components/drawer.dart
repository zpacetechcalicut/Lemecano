import 'package:admin/View/login.dart';
import 'package:admin/View/taxi_booking.dart';
import 'package:admin/View/request.dart';
import 'package:admin/View/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:admin/View/loginn.dart';

import '../constats.dart';

class Drawerr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text(
            'LE MECANO',
            style: TextStyle(color: kPrimaryLightColor, fontSize: 20),
          ),
          decoration: BoxDecoration(
            color: kPrimaryColor,
          ),
        ),
        ListTile(
            leading: Icon(Icons.request_quote),
            title: Text('Request'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Request()),
              );
            }),
        ListTile(
            leading: Icon(Icons.local_taxi_rounded),
            title: Text('Taxi Booking'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Customer()),
              );
            }),
        ListTile(
            leading: Icon(Icons.home_repair_service_sharp),
            title: Text('Service Provider'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ServiceProvider()),
              );
            }),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Log out'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
      ],
    );
  }
}
