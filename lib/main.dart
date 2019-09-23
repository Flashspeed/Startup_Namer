import 'package:flutter/material.dart';
// https://flutter.dev/docs/get-started/codelab
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Hello World', textScaleFactor: 2),
              RaisedButton(
                child: Text("Press"),
                onPressed: () {},
              )
            ],
          ),
        ),

      ),
    );
  }
}
