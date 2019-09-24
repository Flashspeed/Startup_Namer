import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/randomWords/RandomWords.dart';

class RandomWordsState extends State<RandomWords>
{

    /// Saves suggested word pairs
    final List<WordPair> _suggestedStartupNames = <WordPair>[
        WordPair("first", "item"),
        WordPair("second", "item")
    ];

    final Set<WordPair> _savedWordPairs = Set<WordPair>();

    /// Makes the font size larger
    final TextStyle _biggerFontStyle = const TextStyle(fontSize: 18);

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: Text('Startup Name Generator'),
                actions: <Widget>[
                    IconButton(icon: Icon(Icons.list, color: Colors.white,), onPressed: _pushSaved,)
                ],
            ),
            body: _createSuggestedStartupNames(),
        );
    }

    Widget _createSuggestedStartupNames()
    {
        return ListView.builder(
            // Set a padding for the whole ListView
            padding: EdgeInsets.all(16),
            itemBuilder: (context, item)
            {
                if (item.isOdd) return Divider();

                final index = item ~/ 2;

                /* If the index is at the last point in the suggestions array
                *  then add 10 more generated items to the suggestions array.
                *  This creates an infinite view of suggested words */
                if (index >= this._suggestedStartupNames.length)
                {
                    _suggestedStartupNames.addAll(generateWordPairs().take(10));
                }

                return _rowItem(_suggestedStartupNames[index]);
            });
    }

    //_buildRow. The look for each row item
    Widget _rowItem(WordPair wordPair)
    {
        // Check if a word pair has already been saved by the user.
        final bool alreadySaved = this._savedWordPairs.contains(wordPair);

        return ListTile(
            title: Text(
                wordPair.asPascalCase,
                style: _biggerFontStyle,
            ),
            trailing: Icon(
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                color: alreadySaved ? Colors.red : null,
            ),
            onTap: ()
            {
                /*
                 * In Flutter's reactive style framework, calling setState()
                 * triggers a call to the build() method for the State object,
                 * resulting in an update to the UI.
                 */
                setState(()
                {
                    alreadySaved
                        ? _savedWordPairs.remove(wordPair)
                        : _savedWordPairs.add(wordPair);
                });
            },
        );
    }

  void _pushSaved() {
        Navigator.of(context).push(
            MaterialPageRoute<void>(
                builder: (BuildContext context){
                    final Iterable<ListTile> tiles = _savedWordPairs.map(
                        (WordPair wordPair){
                            return ListTile(
                                title: Text(
                                    wordPair.asPascalCase,
                                    style: _biggerFontStyle,
                                ),
                            );
                        },
                    );
                    final List<Widget> divided = ListTile
                        .divideTiles(context: context, tiles: tiles).toList();

                    return Scaffold(
                        appBar: AppBar(
                            title: Text("Saved Suggestions"),
                        ),
                        body: ListView(children: divided)
                    );
                }
            )
        );
  }
}
