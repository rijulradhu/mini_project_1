import 'package:flutter/material.dart';

double val = 1;

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
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
              SizedBox(height: 150.0),
              QuestionCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionCard extends StatefulWidget {
  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {

  int _counter = 0;
  bool _submitBool = true;
  bool _homeBool = false;
  String _buttonText = 'Next';
  String _text = '';
  double _totalScore = 0;
  var color = Colors.grey[600];
  List<String> ques = [
    'How did you like our Service?',
    'How did you appreciate the sanitization?',
    'How was the sound quality?',
    'How was the lighting?',
    'How likely are you to recommend us to your friends?',
    'How likely are you to come back here?'
  ];

  void quesChanger(){
    if(_counter < 5){
      _counter++;
      _totalScore += val;
      val = 1;
      if(_counter == 5){
        _buttonText = 'Submit';
      }
    }
    else{
      _counter = 6;
      _totalScore += val;
      print(_totalScore);
      if(_totalScore < 11){
        _text = 'We are sorry for your inconvenience';
        color = Colors.red[600];
      }
      else if(_totalScore < 21 && _totalScore > 10){
        _text = 'Hope we serve you better next time';
        color = Colors.amber[600];
      }
      else if(_totalScore < 31 && _totalScore > 20){
        _text = 'We hope you come back next time';
        color = Colors.green[600];
      }
      _submitBool = false;
      _homeBool = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360.0,
      width: 360.0,
      child: Card(
        color: Colors.white,
        elevation: 5.0,
        shadowColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        margin: EdgeInsets.fromLTRB(10.0, 16.0, 10.0, 0.0),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  '${_counter <= 5 ? ques[_counter] : _text}',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: color,
                  ),
                ),
              ),
              _submitBool ? MyWidget() : Container(),
              _submitBool ? SizedBox(height: 8.0) : Container(),
              _submitBool ? ElevatedButton(
                onPressed: (){
                  setState(quesChanger);
                },
                child: Text('$_buttonText'),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  elevation: 0,
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  primary: Colors.cyanAccent[700],
                  textStyle: TextStyle(
                    fontSize: 15.0,
                  )
                ),
              ) : Container(),
              _homeBool ? ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text('Home'),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  elevation: 0,
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  primary: Colors.cyanAccent[700],
                  textStyle: TextStyle(
                    fontSize: 15.0,
                  )
                ),
              ) : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidget createState()=>_MyWidget();
}

class _MyWidget extends State<MyWidget> {
  String label ='\u{1F622}';
  var color = Colors.amber[300];
  @override
  Widget build(BuildContext context) {
    return Slider(
      onChanged: (value){
        setState((){
          if(value == 1){
            label = '\u{1F622}';
            color = Colors.amber[300];
          }else if(value == 2){
            label = '\u{2639}';
            color = Colors.amber[400];
          }else if(value == 3){
            label = '\u{1F610}';
            color = Colors.amber[600];
          }else if(value == 4){
            label = '\u{1F642}';
            color = Colors.amber[800];
          }else if(value == 5){
            label = '\u{1F929}';
            color = Colors.amber[900];
          }
          val = value;
        });
      },
      value: val,
      divisions: 4,
      min: 1,
      max: 5,
      label:label,   
      inactiveColor: Colors.cyan[400],
      activeColor: color,   
    );
  }
}