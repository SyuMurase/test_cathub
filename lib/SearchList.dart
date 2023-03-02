import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static const searchDelayMillSec = 1000;
  static const nameList = ['Bob', 'John', 'Fred', 'Emma', 'Charlotte'];
  List<String> searchedNames = [];
  DateTime _lastChangedDate = DateTime.now();

  void search(String text) {
    setState(() {
      if (text.trim().isEmpty) {
        searchedNames = [];
      } else {
        searchedNames =
            nameList.where((element) => element.contains(text)).toList();
      }
    });
  }

  void delayedSearch(String text) {
    Future.delayed(const Duration(milliseconds: searchDelayMillSec), () {
      final nowDate = DateTime.now();
      if (nowDate.difference(_lastChangedDate).inMilliseconds >
          searchDelayMillSec) {
        _lastChangedDate = nowDate;
        search(text);
      }
    });
    //キーワードが入力されるごとに、検索処理を待たずに_lastChangedDateを更新する
    _lastChangedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SearchApp'), centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("検索フォーム", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            TextField(
              onChanged: delayedSearch,
              decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(horizontal: 16)),
            ),
            const SizedBox(height: 16),
            Text('検索結果', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text('Result : ${searchedNames.toString()}')
        ],)
    ));
  }
}
