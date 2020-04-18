import 'dart:convert';

import 'package:flutter/material.dart';
import './todo_detail.dart';
import './components/bottom_nav.dart';


void main() => runApp(MyApp());

var elementHeight = 70.0;
var blackCharcoal = 0xff454545;

var fontTitleSize = 35.0;
var fontRegularSize = 15.0;


class MyApp extends StatelessWidget {
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
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 15, semanticLabel: 'goBack'),
          color: Color(blackCharcoal),
          onPressed: () {},
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
        child: Column(
          children: <Widget>[ToDoListTitleBox(), ToDoListMain()],
        ),
      ),
      bottomNavigationBar: BottomNav()
    );
  }
}


class ToDoListTitleBox extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Column(children: <Widget>[

        Container(
          child: Text(
            "to-do list",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: fontTitleSize, color: Color(blackCharcoal)),
          ),
          width: 155,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 5),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            boxShadow: [
              BoxShadow(
                color: Color(0xffdae3f3),
                spreadRadius: -10, 
                offset: Offset(2, 7),
              )
            ]
          ),

        ),
        
        Text(
          "Click on each task for more details / edit.", 
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: fontRegularSize, color: Color(blackCharcoal).withOpacity(0.75)),
        )
      ],),
    );
  }
}


class ToDoListMain extends StatelessWidget {
  final todo1 = ToDo(id: 1, cate: "relax", title: "Bake pizza");
  final todo2 = ToDo(id: 2, cate: "important", title: "Meeting");
  final todo3 = ToDo(id: 3, cate: "relax", title: "Shopping");


  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Column(children: <Widget>[
        ToDoWidget(),
        ToDoWidget(),
        ToDoWidget(),
        ToDoWidget(),
        
      ])
    );
  }
}


class ToDoWidget extends StatelessWidget {
  Widget build(BuildContext context) {

    return Container(
      child: FlatButton(
        child: Row(children: <Widget>[
          CheckBoxBlank(),
          Text("hello", style: TextStyle(color: Color(blackCharcoal), fontSize: fontRegularSize),),

        ]),
        highlightColor: Color(0xfff0f0f0).withOpacity(0.6),
        splashColor:  Color(0xfff0f0f0).withOpacity(1),
        padding: EdgeInsets.all(0.0),
        onPressed: () {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ToDoDetailScreen()),
          );
        },
      ),
      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
      height: elementHeight,

      decoration: BoxDecoration(
        color: Color(0xffffffff).withOpacity(0.7),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.07),
            blurRadius: 5.0, 
            spreadRadius: 0.5, 
            offset: Offset(2.0, 5.0),
          )
        ]
      ),
    );
  }
}


// form json to list of data instances
// chuyen tu json sang list object, nhung em chua lam duoc :<

// List<ToDo> parseJson(String response) {
//     if(response==null){
//       return [];
//     }
//     final parsed =
//       json.decode(response.toString()).cast<Map<String, dynamic>>();
//       return parsed.map<ToDo>((json) => new ToDo.fromJson(json)).toList();
// }

class CheckBoxBlank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        child: Icon(Icons.check_box_outline_blank, size: 25, color: Color(blackCharcoal).withOpacity(0.8),),
          padding: EdgeInsets.all(1.0),
          onPressed: () {},
          shape: CircleBorder(
            side: BorderSide(width: 1, color: Colors.white.withOpacity(0))
          ),
          highlightColor: Color(0xfff0f0f0).withOpacity(0.6),
          splashColor:  Color(0xfff0f0f0).withOpacity(1),
        ),
      height: 50,
      width: 50,
      margin: EdgeInsets.all(5)
    );
  }
}

class ToDo {
  final int id;
  final String cate;
  final String title;

  ToDo({this.id, this.cate, this.title});

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      id: json['id'],
      cate: json['cate'],
      title: json['title'],
    );
  }
}




// class ToDoListMain extends StatefulWidget {
//   // still not fully understood line 120
//   ToDoListMain({Key key}) : super(key: key);
//   @override 
//   _ToDoListMainState createState() => _ToDoListMainState();
// }


// class _ToDoListMainState extends State<ToDoListMain> {

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(),
//       padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
//       child: ToDoWidgets()
//     );
//   }
// }

// class ToDoWidgets extends StatelessWidget {
//   final List<ToDo> todos;
//   ToDoWidgets({Key key, this.todos}) : super(key: key);

//   @override 
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: todos == null ? 0 : todos.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Container(child: 
//             Row(children: 
//               <Widget>[
//                 Container(
//                   child: FlatButton(
//                     child: Icon(Icons.check_box_outline_blank, size: 25, color: Color(blackCharcoal).withOpacity(0.8),),
//                     padding: EdgeInsets.all(1.0),
//                     onPressed: () {},
//                     shape: CircleBorder(
//                       side: BorderSide(width: 1, color: Colors.white.withOpacity(0))
//                     ),
//                     highlightColor: Color(0xfff0f0f0).withOpacity(0.6),
//                     splashColor:  Color(0xfff0f0f0).withOpacity(1),
//                   ),
//                   height: 50,
//                   width: 50,
//                   margin: EdgeInsets.all(5)
//                 ),
//                 Text(todos[index].title, style: TextStyle(color: Color(blackCharcoal), fontSize: fontRegularSize),)
//               ]
//             ),
//             margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
//             height: elementHeight,

//             decoration: BoxDecoration(
//               color: Color(0xffffffff).withOpacity(0.7),
//               borderRadius: BorderRadius.circular(8),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.07),
//                   blurRadius: 5.0, 
//                   spreadRadius: 0.5, 
//                   offset: Offset(2.0, 5.0),
//                 )
//               ]
//             ),
//           );
//         }
//       );
//   }
// }


var dataJson = 
"""
{
  "data": [
    { 
      "id": 0,
      "cate": "relax",
      "createdOn": "March 8th 2020",
      "details": "Just found a new recipe at pizzafactory.com, must try. ",
      "title": "Bake pizza"
    },

    { 
      "id": 1,
      "cate": "important",
      "createdOn": "March 20th 2020",
      "details": "Join a meeting about a new product at the company",
      "title": "Meeting"
    },

    { 
      "id": 2,
      "cate": "relax",
      "createdOn": "March 16th 2020",
      "details": "Have a date with friends, shopping for new shoes.",
      "title": "Shopping"
    },

    { 
      "id": 3,
      "cate": "study",
      "createdOn": "March 16th 2020",
      "details": "A new programming language to learn.",
      "title": "Learn Dart"
    }
  ]
}
""";