import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  final VoidCallback onSelected;

  FirstScreen({this.onSelected,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Center(
          child:   RaisedButton(
            child: Text("first screen"),

            onPressed: () {
              onSelected();
               },
          ),
        ),
      ),
    );
  }
}
