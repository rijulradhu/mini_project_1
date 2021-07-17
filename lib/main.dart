import 'package:flutter/material.dart';
import 'package:mini_project_1/pages/home.dart';
import 'package:mini_project_1/pages/feedback.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Feedback',
      routes: {
        '/': (context) => Home(),
        '/feedback': (context) => FeedbackPage(),
      },
    );
  }
}