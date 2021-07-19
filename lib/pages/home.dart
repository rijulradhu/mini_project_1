import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        toolbarHeight: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.grey[100],
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Restaurant ',
                  style: TextStyle(
                    color: Colors.cyan[700],
                    fontSize: 24.0,
                    fontFamily: 'sans',
                  ),
                ),
                Text(
                  'Feedback Form',
                  style: TextStyle(
                    color: Colors.cyan[900],
                    fontSize: 24.0,
                    fontFamily: 'sans',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              child: Text('Start'),
              onPressed: (){
                Navigator.pushNamed(context, '/feedback');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.cyanAccent[700],
                padding: EdgeInsets.symmetric(horizontal: 60.0,vertical: 5.0),
                elevation: 2,
                shadowColor: Colors.grey[400],
                shape: StadiumBorder(),
                textStyle: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'sans',
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
