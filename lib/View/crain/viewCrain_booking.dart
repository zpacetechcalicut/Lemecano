import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../constats.dart';

class ViewCrainBooking extends StatefulWidget {
  @override
  _ViewCrainBookingState createState() => _ViewCrainBookingState();
}

class _ViewCrainBookingState extends State<ViewCrainBooking> {
  final dbRef = FirebaseDatabase.instance.reference().child("Crain_Booking");
  //final Future<FirebaseApp> _future = Firebase.initializeApp();
  //int selectedIndex;
  String a;
  var listss = List();
  @override
  Widget build(BuildContext context) {
    double kheight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: kheight / 13,
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
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Name: ",
                                            style: kkTextStyle,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(listss[index]["c_name"],
                                              style: kTextStyle),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Phone no: ",
                                            style: kkTextStyle,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            listss[index]["c_phone"],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Vehicle No: ",
                                            style: kkTextStyle,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            listss[index]["c_vehicle_no"],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Driver name: ",
                                            style: kkTextStyle,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                              listss[index]["c_driver_name"],
                                              style: kTextStyle),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Service area up to(kms): ",
                                            style: kkTextStyle,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                              listss[index]
                                                  ["c_service_area_up_to"],
                                              style: kTextStyle),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Location: ",
                                            style: kkTextStyle,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                              listss[index]["c_location"],
                                              style: kTextStyle),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Working hours: ",
                                            style: kkTextStyle,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                              listss[index]
                                                      ["c_working_hours_from"] +
                                                  " to " +
                                                  listss[index]
                                                      ["c_working_hours_to"],
                                              style: kTextStyle),
                                        ),
                                      ],
                                    ),
                                    FlatButton(
                                      color: kPrimaryColor,
                                      textColor: kPrimaryLightColor,
                                      onPressed: () async {
                                        // setState(() {
                                        //   selectedIndex = index;
                                        // });

                                        // Future<void> _showMyDialog() async {
                                        return showDialog<void>(
                                          context: context,
                                          barrierDismissible:
                                              false, // user must tap button!
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: new Text('Are you sure?'),
                                              content: new Text(
                                                  'Do you want to dismiss this Crain ?'),
                                              actions: <Widget>[
                                                //common button for both verify and disable dialoge box
                                                FlatButton(
                                                  child: Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        color: kPrimaryColor),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                FlatButton(
                                                    color: kPrimaryColor,
                                                    child: Text(() {
                                                      //next button after cancel.....if flat button is verify ,
                                                      //then alert button also verify,
                                                      //and if button click ,status become true,
                                                      //the disable button view as flat button instead of verify flat button
                                                      if (listss[index]
                                                              ["c_status"] ==
                                                          "false") {
                                                        a = "Enable";
                                                        return "Enable";
                                                      } else {
                                                        a = "Disable";
                                                        return "Disable";
                                                      }
                                                    }()),
                                                    onPressed: () {
                                                      setState(() {
                                                        if (a == ("Enable")) {
                                                          dbRef
                                                              .child(
                                                                  listss[index]
                                                                      ["c_id"])
                                                              .update({
                                                            'c_status': "true"
                                                          });
                                                        } else {
                                                          dbRef
                                                              .child(
                                                                  listss[index]
                                                                      ["c_id"])
                                                              .update({
                                                            'c_status': "false"
                                                          });
                                                        }
                                                      });
                                                      Navigator.pop(context);
                                                    }),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      //button for cards.... false: verify
                                      child: Text(() {
                                        if (listss[index]["c_status"] ==
                                            "false") {
                                          return "Enable";
                                        } else {
                                          return "Disable";
                                        }
                                      }()),
                                    ),
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
