import 'package:dictionary/views/detail_page.dart';
import 'package:dictionary/word_model.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isSearching = false;
  String searchWord = '';

  Future<List<WordModel>> showAllWords() async {
    final wordsList = <WordModel>[];

    final m1 = WordModel(word_id: 1, english: 'Dog', turkish: 'Köpek');
    final m2 = WordModel(word_id: 1, english: 'Hi', turkish: 'Merhaba');
    final m3 = WordModel(word_id: 1, english: 'Cat', turkish: 'Kedi');
    final m4 = WordModel(word_id: 1, english: 'Box', turkish: 'Kutu');

    wordsList.addAll([m1, m2, m3, m4]);
    return wordsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            isSearching
                ? TextField(
                  onChanged: (value) {
                    setState(() {
                      searchWord = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Write something for searching',
                  ),
                )
                : Text('Dictionary app'),
        actions: [
          isSearching
              ? IconButton(
                onPressed: () {
                  setState(() {
                    isSearching = false;
                    searchWord = '';
                  });
                },
                icon: Icon(Icons.cancel_outlined),
              )
              : IconButton(
                onPressed: () {
                  setState(() {
                    isSearching = true;
                  });
                },
                icon: Icon(Icons.search),
              ),
        ],
      ),
      body: FutureBuilder(
        future: showAllWords(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                final word = data[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailPage(w1: word ,);
                        },
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 50,
                    child: Card(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              word.english,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              word.turkish,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
