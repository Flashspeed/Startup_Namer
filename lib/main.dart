import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// https://flutter.dev/docs/get-started/codelab

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    String generatedName;

    generateWordPairs().take(1).forEach( (word) => generatedName = word.asPascalCase );

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
              Text(
                  generatedName,
                  textScaleFactor: 2
              ),
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
