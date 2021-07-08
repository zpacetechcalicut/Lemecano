import 'dart:io';

import 'package:admin/Components/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:admin/constats.dart';

import '../ServiceDropdown.dart';
import 'catogery_bookingrequest/Category_services.dart';

class BookingRequest extends StatefulWidget {
  @override
  _BookingRequestState createState() => _BookingRequestState();
}

class _BookingRequestState extends State<BookingRequest> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit ?'),
            actions: <Widget>[
              new FlatButton(
                textColor: kPrimaryColor,
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                textColor: kPrimaryColor,
                onPressed: () => exit(0),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
     double kwidth = MediaQuery.of(context).size.width;
    double kheight = MediaQuery.of(context).size.height;
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Booking Request'),
            backgroundColor: kPrimaryColor,
          ),
          body: Stack(children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: AssetImage("images/BGI.JPEG"), fit: BoxFit.fill)),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height:kheight/20 ,),
                  FlatButton(
                    color: kPrimaryColor,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ServiceDropdown()),
                        );
                      },
                      child: Text("Create Services",style: TextStyle(color:kPrimaryLightColor),)),
                  Container(
                    child: CategoryService(),
                  ),
                ],
              ),
            ),
          ]),
          drawer: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: Drawerr(),
          ),
        ));
  }
}
