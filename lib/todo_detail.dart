import 'package:demo_flutter_thp/main.dart';
import 'package:flutter/material.dart';
import './components/bottom_nav.dart';

var elementHeight = 70.0;
var blackCharcoal = 0xff454545;

var fontTitleSize = 35.0;
var fontRegularSize = 15.0;


class ToDoDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'thp Flutter demo',
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              color: const Color(0xffffffff).withOpacity(0),
              elevation: 0,
            ),
            fontFamily: 'Circular'),
        home: ToDoDetail()
    );
  }
}

class ToDoDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 15, semanticLabel: 'goBack'),
          color: Color(blackCharcoal),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        titleSpacing: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz, size: 25, semanticLabel: 'more'),
            color: Color(blackCharcoal),
            onPressed: () {},
            padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
          ),
        ],
      ),
      body: Center(
        child: ToDoDetailMain()
      ),
      bottomNavigationBar: BottomNav()
    );
  }
}

class ToDoDetailMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Created on March 20th')
      ],
    );
  }
}