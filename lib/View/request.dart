import 'package:admin/Components/drawer.dart';
import 'package:admin/View/service_provider.dart';
import 'package:admin/constats.dart';
import 'package:flutter/material.dart';
import '../Components/request_card.dart';

class Request extends StatefulWidget {
  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  @override
  Widget build(BuildContext context) {
    double kheight = MediaQuery.of(context).size.height;
    
    return Scaffold(
        appBar: AppBar(title: Text('Request'),backgroundColor: kPrimaryColor,),
        body: SingleChildScrollView(
          child: Container(
             margin:   EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(height: kheight/13),
                RequestCard(),

              ],
            ),
          ),
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: Drawerr(),
        ));
  }
}
