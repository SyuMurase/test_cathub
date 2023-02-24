import 'package:flutter/material.dart';

class NavButtom extends StatelessWidget {
  const NavButtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NavButtom'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.35,
          height: 200,
          decoration: BoxDecoration(
              border: Border.all(width: 5, color: Colors.blue),
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all(20),

          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const ListTile(
                leading: Icon(Icons.album),
                title: Text('発案しますか？'),
                // subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(child: const Text("いいえ"), onPressed: () {
                      // CompletePage(),
                    }),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CompletePage()));
                        },
                        child: Text("はい"),),
                    // TextButton(
                    //     child: const Text(
                    //       "はい",
                    //       style: TextStyle(fontWeight: FontWeight.bold),
                    //     ),
                    //     onPressed: () {}),
                  ],
                ),
              ),
              // Text("s"),
            ],
          ),

          // Container(
          //       alignment: Alignment.bottomRight,
          //       color: Colors.amber,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.end,
          //         children: <Widget>[
          //           TextButton(child: const Text("いいえ"), onPressed: () {}),
          //           TextButton(child: const Text("はい", style: TextStyle(fontWeight: FontWeight.bold),), onPressed: () {}),
          //         ],
          //       ),
          //     ),
        ),
      ),
    );
  }
}

class CompletePage extends StatelessWidget {
  const CompletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('完了'),
      ),
      );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
