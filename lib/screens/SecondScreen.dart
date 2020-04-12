import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final VoidCallback onSelected;

  SecondScreen({this.onSelected,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Center(
          child:   RaisedButton(
            child: Text("second screen"),
            onPressed: () {
              onSelected();
            },
          ),
        ),
      ),
    );
  }
}
