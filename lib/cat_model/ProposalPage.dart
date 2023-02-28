import 'package:flutter/material.dart';

class ProposePage extends StatelessWidget {
  const ProposePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("あなた発案"),
      ),
      body: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                height: 300,
                width: 400,
                color: Colors.grey,
                child: Text('Lottie')),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 400,
              child: TextField(
                decoration: InputDecoration(hintText: "あなたの発案を書き殴ってください"),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProposalTittle()));
              },
              child: Text("次へ"))
        ]),
      ),
    );
  }
}

class ProposalTittle extends StatelessWidget {
  const ProposalTittle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("発案のタイトル"),
      ),
      body: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                height: 300,
                width: 400,
                color: Colors.grey,
                child: Text('Lottie')),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 400,
              child: TextField(
                decoration: InputDecoration(hintText: "タイトルを書いてください"),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(onPressed: () {}, child: Text("次へ"))
        ]),
      ),
    );
  }
}
