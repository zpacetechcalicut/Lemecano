import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../constats.dart';

class ViewBooking extends StatefulWidget {
  @override
  _ViewBookingState createState() => _ViewBookingState();
}

class _ViewBookingState extends State<ViewBooking> {
  final dbRef = FirebaseDatabase.instance.reference().child("Taxi_Booking");
  //final Future<FirebaseApp> _future = Firebase.initializeApp();
  //int selectedIndex;
  var listss = List();
  @override
  Widget build(BuildContext context) {
     double kwidth = MediaQuery.of(context).size.width;
    double kheight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: kheight/13,
            ),
            FutureBuilder(
                future: dbRef.once(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    listss.clear();
                    Map<dynamic, dynamic> values = snapshot.data.value;
                    if (values != null) {
                      values.forEach((key, values) {
                        listss.add(values);
                      });
                    }
                    return listss.isEmpty
                        ? Container(
                            child: Center(
                                child: Text(
                            'No Data Found',
                            style: TextStyle(color: kcolorash, fontSize: 20),
                          )))
                        : ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listss.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                  child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                        "Vehicle no: " +
                                            listss[index]["t_vehicle_no"],
                                        style: kTextStyle),
                                    Text(
                                        "Locality: " +
                                            listss[index]["t_locality"],
                                        style: kTextStyle),
                                    Text(
                                        "Vehicle Type: " +
                                            listss[index]["t_type"],
                                        style: kTextStyle),
                                    Text(
                                        "Name of Driver: " +
                                            listss[index]["t_dname"],
                                        style: kTextStyle),
                                    Text(
                                        "Phone no: " + listss[index]["t_phone"],
                                        style: kTextStyle),
                                    Text(
                                        "Driver Licence No: " +
                                            listss[index]["t_license"],
                                        style: kTextStyle),
                                  ],
                                ),
                              ));
                            });
                  }
                  return CircularProgressIndicator(
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(kPrimaryColor),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
