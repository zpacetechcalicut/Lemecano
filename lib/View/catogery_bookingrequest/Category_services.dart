import 'package:admin/constats.dart';
import 'package:flutter/material.dart';

import 'package:admin/View/catogery_bookingrequest/Filter.dart';

class CategoryService extends StatefulWidget {
  @override
  _CategoryServiceState createState() => _CategoryServiceState();
}

String twowheelerservice = "Two Wheeler Service";
String threewheelerservice = "Three Wheeler Service";
String fourwheelerservice = "Four Wheeler Service";
String crainservice = "Crane Service";
String heavyvehicleservice = "Heavy Vehicle Service";
String tyreservice = "Tyre Works";
String washingservice = "Washing Service";
String taxibookingservice = "Taxi Booking Service";

class _CategoryServiceState extends State<CategoryService> {
  @override
  Widget build(BuildContext context) {
    double kwidth = MediaQuery.of(context).size.width;
    double kheight = MediaQuery.of(context).size.height;

    return new Stack(children: <Widget>[
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
              SizedBox(height: kheight / 33),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Filter(
                              a: twowheelerservice,
                            )),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            height: kwidth / 6,
                            width: kwidth / 4,
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                                    image: AssetImage("images/Asset 11.png"),
                                    fit: BoxFit.fill)),
                          ),
                          SizedBox(
                            width: kwidth / 10,
                          ),
                          // Image(image: null),
                          Text(
                            twowheelerservice,
                            style: kkTextStyle,
                          ),
                        ],
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Filter(a: threewheelerservice),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            height: kwidth / 6,
                            width: kwidth / 4,
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                                    image: AssetImage("images/Asset 7.png"),
                                    fit: BoxFit.fill)),
                          ),
                          SizedBox(
                            width: kwidth / 10,
                          ),
                          // Image(image: null),
                          Text(
                            threewheelerservice,
                            style: kkTextStyle,
                          ),
                        ],
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Filter(a: fourwheelerservice),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            height: kwidth / 6,
                            width: kwidth / 4,
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                                    image: AssetImage("images/Asset 14.png"),
                                    fit: BoxFit.fitWidth)),
                          ),
                          SizedBox(
                            width: kwidth / 10,
                          ),
                          // Image(image: null),
                          Text(
                            fourwheelerservice,
                            style: kkTextStyle,
                          ),
                        ],
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Filter(a: crainservice),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            height: kwidth / 6,
                            width: kwidth / 4,
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                                    image: AssetImage("images/Asset 9.png"),
                                    fit: BoxFit.fill)),
                          ),
                          SizedBox(
                            width: kwidth / 10,
                          ),
                          // Image(image: null),
                          Text(
                            crainservice,
                            style: kkTextStyle,
                          ),
                        ],
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Filter(a: heavyvehicleservice),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            height: kwidth / 6,
                            width: kwidth / 4,
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                                    image: AssetImage("images/Asset 13.png"),
                                    fit: BoxFit.fitWidth)),
                          ),
                          SizedBox(
                            width: kwidth / 10,
                          ),
                          // Image(image: null),
                          Text(
                            heavyvehicleservice,
                            style: kkTextStyle,
                          ),
                        ],
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Filter(a: tyreservice),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            height: kwidth / 6,
                            width: kwidth / 4,
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                                    image: AssetImage("images/Asset 10.png"),
                                    fit: BoxFit.fitHeight)),
                          ),
                          SizedBox(
                            width: kwidth / 10,
                          ),
                          // Image(image: null),
                          Text(
                            tyreservice,
                            style: kkTextStyle,
                          ),
                        ],
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Filter(a: washingservice),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            height: kwidth / 6,
                            width: kwidth / 4,
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                                    image: AssetImage("images/Asset 12.png"),
                                    fit: BoxFit.fitHeight)),
                          ),
                          SizedBox(
                            width: kwidth / 10,
                          ),
                          // Image(image: null),
                          Text(
                            washingservice,
                            style: kkTextStyle,
                          ),
                        ],
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Filter(a: taxibookingservice),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            height: kwidth / 6,
                            width: kwidth / 4,
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                                    image: AssetImage("images/Asset 8.png"),
                                    fit: BoxFit.fill)),
                          ),
                          SizedBox(
                            width: kwidth / 10,
                          ),
                          // Image(image: null),
                          Text(
                            taxibookingservice,
                            style: kkTextStyle,
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
