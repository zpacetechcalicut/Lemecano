import 'package:admin/constats.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(title: Text('Reset Password'),backgroundColor: kPrimaryColor,),
      body: Column(
        children: [
          Padding(
                              padding: EdgeInsets.all(20.0),
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
                child: Text('Send Request'),
                onPressed: () {
                  auth.sendPasswordResetEmail(email: _email);
                  Navigator.of(context).pop();
                },
                color: kPrimaryColor,
              ),

            ],
          ),

        ],),
    );
  }
}