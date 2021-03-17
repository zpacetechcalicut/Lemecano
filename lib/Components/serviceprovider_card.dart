import 'package:admin/constats.dart';
import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';

class ServiceCard extends StatefulWidget {
  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  final databaseRef =
      FirebaseDatabase.instance.reference().child("Servicer_Signup");
  //final Future<FirebaseApp> _future = Firebase.initializeApp();
  int selectedIndex;
  var lists = List();
  String a;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: databaseRef.once(),
        builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
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
                        Text("Location : " + lists[index]["sp_loc"],
                            style: kTextStyle),

                        Text("Address : " + lists[index]["sp_address"],
                            style: kTextStyle),
                        Text("Category : " + lists[index]["sp_category"],
                            style: kTextStyle),

                        Text("License : " + lists[index]["sp_license"],
                            style: kTextStyle),
                        Text("Name : " + lists[index]["sp_name"],
                            style: kTextStyle),
                        Text("Owner : " + lists[index]["sp_owner"],
                            style: kTextStyle),
                        Text("Phone : " + lists[index]["sp_phone"],
                            style: kTextStyle),
                        Image.network(
                          lists[index]["sp_proof"],
                        ),
                        Text("Status : " + lists[index]["sp_status"],
                            style: kTextStyle),
                        Text("User Name : " + lists[index]["sp_uname"],
                            style: kTextStyle),
                        Text("Password : " + lists[index]["sp_password"],
                            style: kTextStyle),
                        //FlatButton(color:kPrimaryColor,onPressed: (){},child: Text('hh'),),
                        // FlatButton(onPressed:((){}, child: Text("mmmm")),
                        FlatButton(
                          color: kPrimaryColor,
                          textColor: kPrimaryLightColor,
                          onPressed: () async {
                            setState(() {
                              selectedIndex = index;
                            });

                            // Future<void> _showMyDialog() async {
                            return showDialog<void>(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  // title: Text('Details of Service Provider'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Container(
                                          //height: 200,
                                          //width: 500,
                                          child: Image.network(
                                            lists[selectedIndex]["sp_image"],
                                            loadingBuilder: (
                                              BuildContext context,
                                              Widget child,
                                              ImageChunkEvent loadingProgress,
                                            ) {
                                              if (loadingProgress == null)
                                                return child;
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      new AlwaysStoppedAnimation<
                                                          Color>(kPrimaryColor),
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes
                                                      : null,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Text(
                                            'This The Document From Service Provider'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    //common button for both verify and disable dialoge box
                                    FlatButton(
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(color: kPrimaryColor),
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
                                          if (lists[index]["sp_status"] ==
                                              "false") {
                                            a = "Verify";
                                            return "Verify";
                                          } else {
                                            a = "Disable";
                                            return "Disable";
                                          }
                                        }()),
                                        onPressed: () {
                                          setState(() {
                                            if (a == ("Verify")) {
                                              databaseRef
                                                  .child(lists[index]["sp_id"])
                                                  .update(
                                                      {'sp_status': "true"});
                                            } else {
                                              databaseRef
                                                  .child(lists[index]["sp_id"])
                                                  .update(
                                                      {'sp_status': "false"});
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
                            if (lists[index]["sp_status"] == "false") {
                              return "Verify";
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
            valueColor: new AlwaysStoppedAnimation<Color>(kPrimaryColor),
          );
        });
  }
}
