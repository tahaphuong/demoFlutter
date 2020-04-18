import 'package:flutter/material.dart';

var elementHeight = 70.0;
var blackCharcoal = 0xff454545;

var fontTitleSize = 35.0;
var fontRegularSize = 15.0;


class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
          Container(
            child: Center(
              child: Column(children: <Widget>[
                Icon(Icons.clear_all, size: 30, color: Color(blackCharcoal),),
                Text('To-dos')
              ],)
            ),
            width: MediaQuery.of(context).size.width*0.45,
            height: MediaQuery.of(context).size.width / 6.5,
            decoration: BoxDecoration()
          ),
          Container(
              child: Center(child: Text('')),
              width: MediaQuery.of(context).size.width*0.1,
              height: MediaQuery.of(context).size.width / 6.5,
              decoration: BoxDecoration()),
          Container(
            child: Center(
              child: Column(children: <Widget>[
                Icon(Icons.person_outline, size: 30, color: Color(blackCharcoal),),
                Text('Profile')
              ],)
            ),
            width: MediaQuery.of(context).size.width*0.45,
            height: MediaQuery.of(context).size.width / 6.5,
            decoration: BoxDecoration()
          ),
        ],
      );
  }
}