import 'package:admin/Components/createTaxi_booking.dart';
import 'package:admin/Components/drawer.dart';
import 'package:admin/Components/viewTaxi_booking.dart';
import 'package:admin/View/service_provider.dart';
import 'package:admin/constats.dart';
import 'package:flutter/material.dart';
import '../Components/request_card.dart';

class Customer extends StatefulWidget {
  @override
  _CustomerState createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  DefaultTabController(
        
        length: 2,
          child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: kPrimaryLightColor,
              tabs: [
                Tab(text:"Create Booking",),
                Tab(text:"View Booking",),
               
              ],
            ),
            title: Text('Taxi Booking'),backgroundColor: kPrimaryColor,),
          
          body:  TabBarView(
            children: [
              TaxiForm(),
              ViewBooking(),
              
            ],
          ),
          drawer: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
              child:Drawerr(),
              )),
    ));
  }
}


