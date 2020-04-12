import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  final VoidCallback onSelected;

  ThirdScreen({this.onSelected,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Center(
          child:   RaisedButton(
            child: Text("third screen"),
            onPressed: () {
              onSelected();
            },
          ),
        ),
      ),
    );
  }
}
