import 'package:flutter/material.dart';
import 'questioncard.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {

  var color1 = Colors.amber[300];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        toolbarHeight: 0.0,
        brightness: Brightness.light,
        backgroundColor: Colors.cyan,
        elevation: 0,
      ),
      body: Stack(
          children: [ 
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF00BCD4),
                    Color(0xFF00ACC1),
                    Color(0xFF0097A7),
                    Color(0xFF00838F),
                  ],
                  stops: [0.1,0.4,0.7,0.9]
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton.icon(
                    icon: Icon(Icons.close_rounded, color: Colors.white),
                    label: Text(
                      ' Close',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontFamily: 'sans',
                      )
                    ),
                    onPressed: (){
                      val = 1;
                      Navigator.of(context).pop();
                    },
                  ),
                  QuestionCard(color1),
                ],
              ),
            ),
          ]
      ),
    );
  }
}

