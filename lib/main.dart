import 'package:flutter/material.dart';
import 'package:startup_namer/randomWords/RandomWords.dart';

// https://flutter.dev/docs/get-started/codelab

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
    @override
    Widget build(BuildContext context)
    {
        return MaterialApp(
            home: RandomWords(),
            title: "Startup Name Generator",
        );
    }
}