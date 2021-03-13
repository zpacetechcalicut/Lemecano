import 'package:admin/Components/drawer.dart';
import 'package:admin/Components/serviceprovider_card.dart';
import 'package:admin/constats.dart';

import 'package:flutter/material.dart';


class ServiceProvider extends StatefulWidget {
  @override
  _ServiceProviderState createState() => _ServiceProviderState();
}

class _ServiceProviderState extends State<ServiceProvider> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Service Provider'),backgroundColor: kPrimaryColor,),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.03),
              ServiceCard(),
            ],
          ),
        ),
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
