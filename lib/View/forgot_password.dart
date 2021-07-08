import 'package:admin/constats.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _email;
  final auth = FirebaseAuth.instance;
  final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));

  @override
  Widget build(BuildContext context) {
    double kheight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Reset Password'),
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: kheight / 13,
          ),
          Padding(
            padding: EdgeInsets.all(30.0),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
              keyboardType: TextInputType.emailAddress,
              //controller: emailController,
              decoration: InputDecoration(
                labelText: "Enter Email Address",
                prefixIcon: Icon(
                  Icons.email,
                  color: kPrimaryColor,
                ),
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
                if (!value.contains("@")) {
                  return 'Please Enter Valid Email address';
                }
                return null;
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                textColor: kPrimaryLightColor,
                child: Text('Send Request'),
                onPressed: () {
                  //  Scaffold.of(context).showSnackBar(SnackBar(
                  //                       content: Text('Successfully Added')));

                  auth.sendPasswordResetEmail(email: _email);
                  Navigator.of(context).pop();
                  //  Scaffold.of(context).showSnackBar(SnackBar(
                  //                       content: Text('Successfully Added')));
                },
                color: kPrimaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
