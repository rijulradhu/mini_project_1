import 'package:flutter/material.dart';

double val = 1;

class QuestionCard extends StatefulWidget {
  var color1;
  QuestionCard(this.color1);
  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {

  int _counter = 0;
  bool _submitBool = true;
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
  IconData endScreen = Icons.sentiment_very_satisfied;
  List<IconData> quesIcon = [
    Icons.room_service,
    Icons.sanitizer,
    Icons.music_note,
    Icons.lightbulb,
    Icons.group,
    Icons.reviews
  ];
  IconData quesScreen = Icons.room_service;

  void quesChanger(){
    if(_counter < 5){
      _counter++;
      _totalScore += val;
      val = 1;
      quesScreen = quesIcon[_counter];
      widget.color1 = Colors.amber[300];
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
        endScreen = Icons.sentiment_very_dissatisfied;
      }
      else if(_totalScore < 21 && _totalScore > 10){
        _text = 'Hope we serve you better next time';
        color = Colors.amber[600];
        endScreen = Icons.sentiment_neutral;
      }
      else if(_totalScore < 31 && _totalScore > 20){
        _text = 'We hope you come back next time';
        color = Colors.green[600];
        endScreen = Icons.sentiment_very_satisfied;
      }
      _submitBool = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        elevation: 5.0,
        shadowColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        margin: EdgeInsets.fromLTRB(10.0, 160.0, 10.0, 0.0),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 24.0),
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 700),
            child: _submitBool ? Column(
              key: ValueKey(1),
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Icon(
                  quesScreen,
                  size: 75.0,
                  color: Colors.amber[600],
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 40,
                  minHeight: 40,
                ),
                child: Text(
                    '${ques[_counter]}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: color,
                    ),
                  ),
              ),
              SizedBox(height: 40.0,),
              MyWidget(widget.color1),
              SizedBox(height: 10.0),
              ElevatedButton(
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
              ),
            ],
          ) : Column(
            key: ValueKey(2),
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Icon(
                  endScreen,
                  color: color,
                  size: 75.0,
                ),
              ),
              Text(
                  '$_text',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: color,
                  ),
                ),
              SizedBox(height: 102.0,),
              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text('Home'),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  elevation: 0,
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  primary: color,
                  textStyle: TextStyle(
                    fontSize: 15.0,
                  )
                ),
              ),
            ],
          ),
          ),
        ),
      );
  }
}

class MyWidget extends StatefulWidget {
  var color1;
  MyWidget(this.color1);

  @override
  _MyWidget createState()=>_MyWidget();
}

class _MyWidget extends State<MyWidget> {
  String label ='\u{1F622}';
  @override
  Widget build(BuildContext context) {
    return Slider(
      onChanged: (value){
        setState((){
          if(value == 1){
            label = '\u{1F622}';
            widget.color1 = Colors.amber[300];
          }else if(value == 2){
            label = '\u{2639}';
            widget.color1 = Colors.amber[400];
          }else if(value == 3){
            label = '\u{1F610}';
            widget.color1 = Colors.amber[600];
          }else if(value == 4){
            label = '\u{1F642}';
            widget.color1 = Colors.amber[800];
          }else if(value == 5){
            label = '\u{1F929}';
            widget.color1 = Colors.amber[900];
          }
          val = value;
        });
      },
      value: val,
      divisions: 4,
      min: 1,
      max: 5,
      label:label,   
      inactiveColor: Colors.cyan[200],
      activeColor: widget.color1,   
    );
  }
}