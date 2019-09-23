import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:startup_namer/randomWords/RandomWords.dart';

class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    /* Generate one word and transform it to pascal casing */

    return Text(WordPair.random().asPascalCase );
  }
}
