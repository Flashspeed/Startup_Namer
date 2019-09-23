import 'package:english_words/english_words.dart' as prefix0;
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/randomWords/RandomWords.dart';

class RandomWordsState extends State<RandomWords>
{

    /// Saves suggested word pairs
    final _suggestions = <WordPair>[];

    /// Makes the font size larger
    final _biggerFontStyle = const TextStyle(fontSize: 18);

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: Text('Startup Name Generator'),
            ),
            body: _buildSuggestions(),
        );
    }

    Widget _buildSuggestions()
    {
        return ListView.builder(
            padding: EdgeInsets.all(16),
            itemBuilder: (context, item)
            {
                if (item.isOdd) return Divider();

                final index = item ~/ 2;

                if (index >= this._suggestions.length)
                {
                    _suggestions.addAll(prefix0.generateWordPairs().take(10));
                }

                return _buildRow(_suggestions[index]);
            });
    }

    Widget _buildRow(WordPair wordPair)
    {
        return ListTile(
            title: Text(
                wordPair.asPascalCase,
                style: _biggerFontStyle,
            ),
        );
    }
}
