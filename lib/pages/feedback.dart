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
        backgroundColor: Colors.grey[100],
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                icon: Icon(Icons.close_rounded, color: Colors.grey[500]),
                label: Text(
                  ' Close',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14.0,
                    )
                  ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              QuestionCard(color1),
            ],
          ),
        ),
      ),
    );
  }
}

