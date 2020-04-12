import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget SlideDots(bool isActive, int i, int length) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 150),
    margin: EdgeInsets.symmetric(horizontal: 8),
    height: isActive ? 20 :12,
    width: isActive ? 20 :12,
    decoration: BoxDecoration(
        color: isActive ? Colors.yellowAccent : Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(60))),
    child: Center(
        child: Text("$i"),
      ),
  );
}

