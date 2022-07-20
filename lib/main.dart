import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Generator nazw', //<- Odpowiada za tytuł karty w przeglądarce / tytuł aplikacji
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Generator nazw'), //<- Tytuł u góry apki
          backgroundColor: Colors.green,
        ),
        body: const Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}
class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);
  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[]; //Tablica przechowująca Pary wyrazów
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context , i) { //<- Jest wzywane gdy chcemy stworzyć sugerowane nazwy (łączyć słowa w pary). Automatycznie zbiera nasze pary w liście. 'i' to ilość słów (nie par), np. 100 słów to 50 par w indexie
        if (i.isOdd) return const Divider(); /*2 - daje podziałkę/linię między każdym elementem na liście o grubości 1 pixela*/
        final index = i ~/ 2; /*3 - dzieli ilość słów na pary dięki czemu wiadomo ile par powstało np. 1, 2, 3, 4, 5 zamienia się w 0, 1, 1, 2, 2*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4 - Gdy dotrzesz do końca listy, generowane jest kolejne 10 propozycji*/
    }
        return ListTile( //Lista z 'kafelkami'
          title: Text(_suggestions[index].asPascalCase,
          style: _biggerFont
          ),


          );
    },
    );
  }
}


