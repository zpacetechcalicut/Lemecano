import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';

import '../constats.dart';

class RequestCard extends StatefulWidget {
  @override
  _RequestCardState createState() => _RequestCardState();
}

class _RequestCardState extends State<RequestCard> {
  final databaseRef =
      FirebaseDatabase.instance.reference().child("Service_Booking");
  //final Future<FirebaseApp> _future = Firebase.initializeApp();
  var lists = new List();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: databaseRef.once(),
        builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
          //if (!snapshot.hasData || snapshot.data){}
          if (snapshot.hasData) {
            lists.clear();
            Map<dynamic, dynamic> values = snapshot.data.value;
            if(values !=null){
            values.forEach((key, values) {
              lists.add(values);
            });}

            return lists.isEmpty
                ? Container(child: Center(child: Text('No Data Found',style: TextStyle(color: kcolorash,fontSize: 20),)))
                : ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: lists.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Name: " + lists[index]["b_name"],
                                style: kTextStyle),
                            Text("Company Name: " + lists[index]["b_category"],
                                style: kTextStyle),
                            // Text("Age: " + lists[index]["age"]),
                            // Text("Type: " + lists[index]["type"]),
                          ],
                        ),
                      ));
                    });
          } else {
            Text("no data");
          }
          return CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(kPrimaryColor),
          );
        });
  }
}
