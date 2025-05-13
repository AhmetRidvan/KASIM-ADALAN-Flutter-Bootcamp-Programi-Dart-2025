import 'package:dictionary/views/detail_page.dart';
import 'package:dictionary/word_model.dart';
import 'package:dictionary/worddao.dart';
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
    final wordsList = await WordDao.allWord();

    return wordsList;
  }

  Future<List<WordModel>> search(String searchWord) async {
    final wordsList = await WordDao.search(searchWord);

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
        future: isSearching ? search(searchWord) : showAllWords(),
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
                          return DetailPage(w1: word);
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
