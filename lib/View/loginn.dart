import 'package:admin/View/request.dart';
import 'package:admin/constats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'forgot_password.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _email, _password;
  // final auth = FirebaseAuth.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final formkeyy = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    double kwidth = MediaQuery.of(context).size.width;
    double kheight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: kPrimaryColor,
        //key: _con.scaffoldKey,
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
            child: Stack(alignment: AlignmentDirectional.topCenter, children: <
                Widget>[
          Positioned(
              top: 0,
              child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: Image.asset(
                          'images/logos.png',
                          height: 150,
                          width: 150,
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
                  height: kheight / 2,
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
                      margin: EdgeInsets.all(20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
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
                            Padding(
                              padding: EdgeInsets.all(20.0),
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
                                  if (value.length < 3) {
                                    return 'Please Enter valid Password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(height: 60),
                            SizedBox(
                              height: 50,
                              child: RaisedButton(
                                textColor: kPrimaryLightColor,
                                color: kPrimaryColor,
                                shape: StadiumBorder(),
                                onPressed: () {
                                  auth
                                      .signInWithEmailAndPassword(
                                          email: _email, password: _password)
                                      .then((_) {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => Request()));
                                  });
                                },
                                child: Text(
                                  "Login",
                                  style:
                                      TextStyle(fontSize: 16, letterSpacing: 1),
                                ),
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => ResetScreen()));
                                  },
                                  textColor: Theme.of(context).hintColor,
                                  child: Text("Forgot Password"),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  )))
        ])));
  }

//   void _login() {
//     UserCredential uc = auth.signInWithEmailAndPassword( _email, _password )
// .then( function onSuccess( ...args ) {
//   console.log( 'onSuccess', args );
// } )
// .catch( function onFailure( err ) {
//   console.log( 'onFailure', err );
// } );
//         //.signInWithEmailAndPassword(email: _email, password: _password);

//       Navigator.of(context)
//           .pushReplacement(MaterialPageRoute(builder: (context) => Request()));
//     });
//   }
  // Future<void> signIn(String email, String password) async {

  //       await auth.signInWithEmailAndPassword(email: email, password: password).catchError(print(""));
  //   //return user.credential;
  // }

// .then( function onSuccess( ...args ) {
//   console.log( 'onSuccess', args );
// } )
// .catch( function onFailure( err ) {
//   console.log( 'onFailure', err );
// } );
// }
}
