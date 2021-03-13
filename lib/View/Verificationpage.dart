import 'package:admin/View/request.dart';
import 'package:flutter/material.dart';


class VerificationPage extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
          body: Container(
            margin: EdgeInsets.all(30),
            child: Column(
        children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey[100]),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Form(child: TextFormField()),
            ),
            FlatButton(
              color: Colors.yellow,
              onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Request()),
              );
            }),
        ],
      ),
          ),
    );
  }
}
