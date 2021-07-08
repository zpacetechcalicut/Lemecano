import 'package:admin/constats.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'booking_request.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool a;
  String _email, _password;
  final auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formkeyy = GlobalKey<FormState>();
  final GlobalKey<FormState> alertformkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

//function for alertbox of forgot password
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Forgot Password'),
          content: SingleChildScrollView(
            child: Form(
              key: alertformkey,
              child: Padding(
                padding: EdgeInsets.all(20),
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
                    if (value != 'lemecanoind@gmail.com') {
                      return 'Please Enter Valid Email address';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              textColor: kPrimaryColor,
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
                textColor: kPrimaryLightColor,
                color: kPrimaryColor,
                child: Text('Send Request'),
                onPressed: () {
                  if (alertformkey.currentState.validate()) {
                    _resetPassword();
                  }
                }),
          ],
        );
      },
    );
  }

  //fuction for reset password
  void _resetPassword() async {
    try {
      await auth.sendPasswordResetEmail(email: _email);
      Navigator.of(context).pop();
      _scaffoldkey.currentState.showSnackBar(new SnackBar(
          content:
              new Text('Password Reset Link send to your verified Email')));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: 'No user found for that email !',
            toastLength: Toast.LENGTH_SHORT,
            //gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        // _scaffoldkey.currentState.showSnackBar(
        //     new SnackBar(content: new Text('No user found for that email!')));
        //
        // print('No user found for that email.');
      }
    }
  }

//function for snackbars for validation of login
  void _signIn() async {
    try {
      User user = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: _email, password: _password))
          .user;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BookingRequest()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: 'No user found for that email !',
            toastLength: Toast.LENGTH_SHORT,
            //gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        // _scaffoldkey.currentState.showSnackBar(
        //     new SnackBar(content: new Text('No user found for that email!')));

        // print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
            msg: 'Wrong password provided for that user.',
            toastLength: Toast.LENGTH_SHORT,
            //gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        // _scaffoldkey.currentState.showSnackBar(
        //     new SnackBar(content: new Text(' You provided wrong password!')));
        // print('Wrong password provided for that user.');
      }
    }
  }

  //final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    double kwidth = MediaQuery.of(context).size.width;
    double kheight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          key: _scaffoldkey,
          backgroundColor: kPrimaryColor,
          //key: _con.scaffoldKey,
          resizeToAvoidBottomPadding: false,
          body: SafeArea(
              child:
                  Stack(alignment: AlignmentDirectional.topCenter, children: <
                      Widget>[
            Positioned(
                top: 0,
                child: Container(
                    padding: EdgeInsets.fromLTRB(0, kwidth / 25, 0, 0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              child: Image.asset(
                            'images/logos.png',
                            height: kheight / 4,
                            width: kwidth / 4,
                          )),
                        ],
                      ),
                    ),
                    width: kwidth,
                    height: kheight / 3,
                    color: kPrimaryLightColor)),
            Positioned(
                top: kheight / 4,
                child: Container(
                    width: kwidth / 1.2,
                    height: kheight / 1.6,
                    decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 50,
                            color: kPrimaryColor.withOpacity(0.2),
                          )
                        ]),
                    child: Form(
                      key: formkeyy,
                      // key: _con.loginFormKey,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            kwidth / 18, kwidth / 18, kwidth / 18, 0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(kwidth / 18),
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
                                    if (value != 'lemecanoind@gmail.com') {
                                      return 'Please Enter Valid Email address';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(kwidth / 18),
                                child: TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      _password = value.trim();
                                    });
                                  },
                                  autofocus: false,
                                  obscureText: true,

                                  //keyboardType: TextInputType.visiblePassword,
                                  // controller: passwordController,
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    prefixIcon: Icon(
                                      Icons.lock,
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
                                    if (value.length < 5) {
                                      return 'Please Enter valid Password';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: kheight / 13),
                              SizedBox(
                                height: kheight / 20,
                                child: RaisedButton(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: 16, letterSpacing: 1),
                                    ),
                                    textColor: kPrimaryLightColor,
                                    color: kPrimaryColor,
                                    onPressed: () {
                                      if (formkeyy.currentState.validate()) {
                                        _signIn();
                                      }
                                    }),
                              ),
                              Column(
                                children: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      _showMyDialog();
                                    },
                                    textColor: Theme.of(context).hintColor,
                                    child: Text("Forgot Password"),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    )))
          ]))),
    );
  }
}
