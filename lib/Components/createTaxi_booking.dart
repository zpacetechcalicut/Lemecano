import 'package:admin/constats.dart';
import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';

class TaxiForm extends StatefulWidget {
  @override
  _TaxiFormState createState() => _TaxiFormState();
}

class _TaxiFormState extends State<TaxiForm> {
  final _formKey = GlobalKey<FormState>();
  final listOfPets = [
    " ",
    "2-Wheeler",
    "3-Wheeler",
    "4-Wheeler",
    "Heavy vehicle"
  ];
  String dropdownValue = ' ';
  final phnController = TextEditingController();
  final vehiclennoController = TextEditingController();
  final localityController = TextEditingController();
  final nameController = TextEditingController();
  final licencenoController = TextEditingController();
  final dbRef = FirebaseDatabase.instance.reference().child("Taxi_Booking");

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                      
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: vehiclennoController,
                      decoration: InputDecoration(
                        labelText: "Vehicle Number",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kcolorash),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kcolorash),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter Vehicle Number';
                        }
                        return null;
                      },
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextFormField(
                       keyboardType: TextInputType.number,
                      controller: phnController,
                      decoration: InputDecoration(
                        labelText: "Contact Number",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kcolorash),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kcolorash),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Contact Number';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: localityController,
                      decoration: InputDecoration(
                        labelText: "Locality",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kcolorash),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kcolorash),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Locality';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: DropdownButtonFormField(
                      value: dropdownValue,
                      // icon: Icon(Icons.arrow_downward),
                      decoration: InputDecoration(
                        labelText: "Select Vehicle Type",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kcolorash),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kcolorash),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      items: listOfPets.map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Select Vehicle';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextFormField(
                      // keyboardType: TextInputType.number,
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Name of Driver",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kcolorash),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kcolorash),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Name of Driver';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextFormField(
                      // keyboardType: TextInputType.number,
                      controller: licencenoController,
                      decoration: InputDecoration(
                        labelText: "Driver License Number",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kcolorash),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kcolorash),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Driver License Number';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            textColor: kPrimaryLightColor,
                            color: kPrimaryColor,
                            onPressed: () {
                              setState(() {
                                dropdownValue = " ";
                              });

                              if (_formKey.currentState.validate()) {
                                dbRef.push().set({
                                  "t_vehicle_no": vehiclennoController.text,
                                  "t_locality": localityController.text,
                                  "t_phone":phnController.text,
                                  "t_type": dropdownValue,
                                  "t_dname": nameController.text,
                                  "t_license": licencenoController.text,
                                }).then((_) {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text('Successfully Added')));
                                  vehiclennoController.clear();
                                  localityController.clear();
                                  phnController.clear();
                                  nameController.clear();
                                  licencenoController.clear();
                                }).catchError((onError) {
                                  Scaffold.of(context).showSnackBar(
                                      SnackBar(content: Text(onError)));
                                });
                              }
                            },
                            child: Text('Submit'),
                          ),
                        ],
                      )),
                ]))),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    vehiclennoController.dispose();
    localityController.dispose();
    nameController.dispose();
    phnController.dispose();
    licencenoController.dispose();
    //dropdownValue = " ";
  }
}
