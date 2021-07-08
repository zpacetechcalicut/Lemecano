import 'package:admin/View/auto/auto_boooking.dart';
import 'package:admin/View/booking_request.dart';
import 'package:admin/View/crain/crain_boooking.dart';
import 'package:admin/View/taxi/taxi_booking.dart';

import 'package:admin/View/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:admin/View/loginn.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../constats.dart';

class Drawerr extends StatelessWidget {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    double kwidth = MediaQuery.of(context).size.width;

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
        Column(
          children: [
            SizedBox(
              width: kwidth / 20,
            ),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookingRequest()),
                );
              },
              child: Row(
                children: [
                  SizedBox(
                    height: kwidth / 8,
                    width: kwidth / 20,
                  ),
                  Container(
                    height: kwidth / 17,
                    width: kwidth / 17,
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                            image: AssetImage("images/Asset 2.png"),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    width: kwidth / 15,
                  ),
                  Text(
                    "Booking Request",
                    style: kkkTextStyle,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: kwidth / 15,
            ),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TaxiService()),
                );
              },
              child: Row(
                children: [
                  SizedBox(
                    height: kwidth / 8,
                    width: kwidth / 20,
                  ),
                  Container(
                    height: kwidth / 17,
                    width: kwidth / 17,
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                            image: AssetImage("images/Asset 4.png"),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    width: kwidth / 15,
                  ),
                  Text(
                    "Taxi Service",
                    style: kkkTextStyle,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: kwidth / 15,
            ),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AutoService()),
                );
              },
              child: Row(
                children: [
                  SizedBox(
                    height: kwidth / 8,
                    width: kwidth / 20,
                  ),
                  Container(
                    height: kwidth / 22,
                    width: kwidth / 17,
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                            image: AssetImage("images/Asset 6.png"),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    width: kwidth / 15,
                  ),
                  Text(
                    "Auto Service",
                    style: kkkTextStyle,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: kwidth / 15,
            ),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CrainService()),
                );
              },
              child: Row(
                children: [
                  SizedBox(
                    height: kwidth / 8,
                    width: kwidth / 20,
                  ),
                  Container(
                    height: kwidth / 17,
                    width: kwidth / 17,
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                            image: AssetImage("images/Asset 5.png"),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    width: kwidth / 15,
                  ),
                  Text(
                    "Crane Service",
                    style: kkkTextStyle,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: kwidth / 15,
            ),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ServiceProvider()),
                );
              },
              child: Row(
                children: [
                  SizedBox(
                    height: kwidth / 8,
                    width: kwidth / 20,
                  ),
                  Container(
                    height: kwidth / 17,
                    width: kwidth / 17,
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                            image: AssetImage("images/Asset 1.png"),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    width: kwidth / 15,
                  ),
                  Text(
                    "Service provider",
                    style: kkkTextStyle,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: kwidth / 15,
            ),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                _signOut().then(
                  (value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                );
              },
              child: Row(
                children: [
                  SizedBox(
                    height: kwidth / 8,
                    width: kwidth / 20,
                  ),
                  Container(
                    height: kwidth / 17,
                    width: kwidth / 17,
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                            image: AssetImage("images/Asset 3.png"),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    width: kwidth / 15,
                  ),
                  Text(
                    "Log Out",
                    style: kkkTextStyle,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: kwidth / 15,
            ),
          ],
        ),
      ],
    );
  }
}
