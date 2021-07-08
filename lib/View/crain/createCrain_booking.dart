import 'package:admin/constats.dart';
import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';

class CrainForm extends StatefulWidget {
  @override
  _CrainFormState createState() => _CrainFormState();
}

class _CrainFormState extends State<CrainForm> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phnController = TextEditingController();

  final vehiclenoController = TextEditingController();

  final drivernameController = TextEditingController();
  final workinghoursController = TextEditingController();
  final serviceareaController = TextEditingController();
  final locationController = TextEditingController();
  String newkey;
  //String newkey = dbRef.key;
  // print(dbRef);
//time picker
  TimeOfDay _timefrom = TimeOfDay(hour: 0, minute: 0);
  TimeOfDay _timeto = TimeOfDay(hour: 0, minute: 0);
  String from = "00.00";
  String to = "00.00";
  bool _isPressedfrom = false;
  bool _isPressedto = false;
  void _selectTimefrom() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _timefrom,
    );

    if (newTime != null) {
      setState(() {
        _timefrom = newTime;

        _isPressedfrom = !_isPressedfrom;
      });
      if (_isPressedfrom) {
        from = " ${_timefrom.format(context)}";
      }
    }
  }

  void _selectTimeto() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _timeto,
    );
    if (newTime != null) {
      setState(() {
        _timeto = newTime;
        // to = " ${_timeto.format(context)}";
        _isPressedto = !_isPressedto;
      });
      if (_isPressedto) {
        to = " ${_timeto.format(context)}";
      }
    }
  }

  final dbRef = FirebaseDatabase.instance.reference();

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
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Name",
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
                          return 'Enter Name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: drivernameController,
                      decoration: InputDecoration(
                        labelText: "Driver Name",
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
                          return 'Please Enter Driver Name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: phnController,
                      decoration: InputDecoration(
                        labelText: "Phone No",
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
                          return 'Please Enter Phone No';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: vehiclenoController,
                      decoration: InputDecoration(
                        labelText: "Vehicle No",
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
                          return 'Please Enter Vehicle No';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextFormField(
                      // keyboardType: TextInputType.number,
                      controller: serviceareaController,
                      decoration: InputDecoration(
                        labelText: "Service Area Up To",
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
                          return 'Please Enter Service Area Up To';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextFormField(
                      // keyboardType: TextInputType.number,
                      controller: locationController,
                      decoration: InputDecoration(
                        labelText: "Location",
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
                          return 'Please Enter Location';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Working Hours: ',
                          style: kkTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("From :"),
                                IconButton(
                                  icon: Icon(Icons.access_alarm),
                                  onPressed: _selectTimefrom,
                                ),
                                Text("$from"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("To :"),
                                IconButton(
                                  icon: Icon(Icons.access_alarm),
                                  onPressed: _selectTimeto,
                                ),
                                Text("$to"),
                              ],
                            ),
                          ],
                        ),
                      ],
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
                              // String newKey = dbRef.push().key;
                              if (_formKey.currentState.validate()) {
                                //dbRef.push().set
                                String newkey =
                                    dbRef.child('Crain_Booking').push().key;
                                dbRef.child('Crain_Booking').child(newkey).set({
                                
                                  "c_id": newkey,
                                  "c_name": nameController.text,
                                  "c_phone": phnController.text,
                                  "c_vehicle_no": vehiclenoController.text,
                                  "c_driver_name": drivernameController.text,
                                  "c_working_hours_from": from,
                                  // " ${_timefrom.format(context)}",
                                  "c_working_hours_to": to,
                                  //" ${_timeto.format(context)}",
                                  "c_service_area_up_to":
                                      serviceareaController.text,
                                  "c_status": "true",
                                  "c_location": locationController.text,
                                }).then((_) {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text('Successfully Added')));
                                  nameController.clear();
                                  phnController.clear();
                                  vehiclenoController.clear();
                                  drivernameController.clear();

                                  serviceareaController.clear();
                                  locationController.clear();
                                }).catchError((onError) {
                                  Scaffold.of(context).showSnackBar(
                                      SnackBar(content: Text(onError)));
                                });
                              }
                              setState(() {
                                from = "00.00";
                                to = "00.00";
                                // _timefrom = TimeOfDay(hour: 0, minute: 0);
                                // _timeto = TimeOfDay(hour: 0, minute: 0);
                              });
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
    nameController.dispose();
    phnController.dispose();
    vehiclenoController.dispose();
    drivernameController.dispose();

    serviceareaController.dispose();
    locationController.dispose();
    //dropdownValue = " ";
  }
}
