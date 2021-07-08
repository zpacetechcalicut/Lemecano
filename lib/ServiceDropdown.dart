import 'package:admin/View/taxi/createTaxi_booking.dart';
import 'package:admin/constats.dart';
import 'package:flutter/material.dart';

import 'View/auto/createAuto_booking.dart';
import 'View/crain/createCrain_booking.dart';

class ServiceDropdown extends StatefulWidget {
  // const ServiceDropdown({ Key? key }) : super(key: key);

  @override
  _ServiceDropdownState createState() => _ServiceDropdownState();
}

class _ServiceDropdownState extends State<ServiceDropdown> {
  String _chosenValue;
  @override
  Widget build(BuildContext context) {
    double kwidth = MediaQuery.of(context).size.width;
    double kheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
              child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                color: kPrimaryColor,
                child: Center(
                  child: DropdownButton<String>(
                    iconDisabledColor: kPrimaryColor,
                    dropdownColor: kPrimaryColor,
                    focusColor: kPrimaryColor,
                    value: _chosenValue,
                    //elevation: 5,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: kPrimaryLightColor,
                    items: <String>[
                      "Add service"
                      "Taxi Service",
                      'Auto Service',
                      'Crain Service',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: kPrimaryLightColor),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "Choose Your Service",
                      style: TextStyle(
                          color: kPrimaryLightColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        _chosenValue = value;
                      });
                    },
                  ),
                ),
              ),
              Column(children: [
                if (_chosenValue == "Taxi Service") ...[
                  TaxiForm(),
                ] else if (_chosenValue == "Auto Service") ...[
                  AutoForm(),
                ] else if (_chosenValue == "Crain Service") ...[
                  CrainForm(),
                  ]else if (_chosenValue == "Add Service") ...[
                  AutoForm(),
                ],
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
