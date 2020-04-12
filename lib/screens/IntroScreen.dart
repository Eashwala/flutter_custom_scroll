import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/screens/FirstScreen.dart';
import 'package:my_app/screens/ThirdScreen.dart';
import 'package:my_app/widgets/CustomScrollPhysics.dart';
import 'package:my_app/widgets/SlideDots.dart';

import 'SecondScreen.dart';

class IntroScreen extends StatefulWidget {


  @override
  _GettingStartedScreenState createState() => _GettingStartedScreenState();

}

class _GettingStartedScreenState extends State<IntroScreen> {
  static int _currentPage = 0;
  static int count=0;
  static bool moveRight;
  static final PageController _pageController = PageController(initialPage: 0,  keepPage: true);


  static final List<Widget> introWidgetsList = <Widget>[
    FirstScreen(onSelected: () {changePage(introWidgetsList.length);
    },),
   SecondScreen(onSelected: () {changePage(introWidgetsList.length);
    },),
    ThirdScreen(onSelected: () {changePage(introWidgetsList.length);
    },),

  ];

  @override
  void initState() {
    super.initState();
    print("init");
    moveRight = false;
  }

  @override
  dispose() {
    super.dispose();
    print("dispose");
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      print("page change");
      moveRight= true;
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  PageView.builder(
                    physics:CustomScrollPhysics(moveRight),
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    itemCount: introWidgetsList.length,
                    itemBuilder: (context, index) {
                      return introWidgetsList[index];
                    },
                  ),
                  Stack(
                    alignment: AlignmentDirectional.topStart,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(bottom: 35),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            for(int i = 0; i<introWidgetsList.length; i++)
                              if( i == _currentPage )
                                SlideDots(true, _currentPage+1, introWidgetsList.length)
                              else
                                SlideDots(false, _currentPage+1, introWidgetsList.length)
                          ],
                        ),
                      )
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  static void changePage(int length) {

    if (_currentPage < length) {
      _currentPage++;
      print("page change");
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      moveRight = false;
    } else if(_currentPage == length) {
      print("same page");
    }
    else {
      _currentPage = 0;
      print("first page");

    }
  }
}
