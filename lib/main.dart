import 'package:flutter/material.dart';
import 'package:startup_namer/randomWords/RandomWords.dart';

// https://flutter.dev/docs/get-started/codelab

void main()
=> runApp(MyApp());

class MyApp extends StatelessWidget
{
    @override
    Widget build(BuildContext context)
    {
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
                            RandomWords(),
                            RaisedButton(
                                child: Text("Press"),
                                color: Color.fromARGB(100, 255, 100, 100),
                                onPressed: ()
                                {

                                },
                            )
                        ],
                    ),
                ),
            ),
        );
    }
}
