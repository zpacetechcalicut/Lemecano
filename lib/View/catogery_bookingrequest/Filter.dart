import 'package:admin/Components/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../constats.dart';

class Filter extends StatelessWidget {
  final String a;
  Filter({this.a});

  final dbRef = FirebaseDatabase.instance.reference().child("Service_Booking");

  var listss = List();
  @override
  Widget build(BuildContext context) {
    double kheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(a),
        backgroundColor: kPrimaryColor,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: AssetImage("images/BGI.JPEG"), fit: BoxFit.fill)),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: kheight / 13,
                    ),
                    FutureBuilder(
                        future: dbRef.once(),
                        builder:
                            (context, AsyncSnapshot<DataSnapshot> snapshot) {
                          if (snapshot.hasData) {
                            listss.clear();
                            Map<dynamic, dynamic> values = snapshot.data.value;
                            if (values != null) {
                              values.forEach((key, values) {
                                if (values["b_category"] == a) {
                                  listss.add(values);
                                }
                              });
                            }

                            return listss.isEmpty
                                ? Container(
                                    child: Center(
                                        child: Text(
                                    'No Data Found',
                                    style: TextStyle(
                                        color: kcolorash, fontSize: 20),
                                  )))
                                : ListView.builder(
                                    physics: ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: listss.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Card(
                                          child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "User Name: ",
                                                    style: kkTextStyle,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                      listss[index]["b_name"],
                                                      style: kTextStyle),
                                                )
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "Service Provider: ",
                                                    style: kkTextStyle,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                      listss[index]["b_sp"],
                                                      style: kTextStyle),
                                                )
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "Requested On: ",
                                                    style: kkTextStyle,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                      listss[index]["b_reg"],
                                                      style: kTextStyle),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "Alloted Date: ",
                                                    style: kkTextStyle,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                      listss[index]["b_date"],
                                                      style: kTextStyle),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "Alloted time: ",
                                                    style: kkTextStyle,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                      listss[index]["b_time"],
                                                      style: kTextStyle),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ));
                                    });
                          }
                          return CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(
                                kPrimaryColor),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Drawerr(),
      ),
    );
  }
}
