import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WidgetExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WidgetExample extends StatelessWidget {
  const WidgetExample({Key? key}) : super(key: key);
  
  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter'),
      ),
      body: Center(
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.all(100),
              child: SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.35,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '数値',
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)
                          )
                          ),
                  onChanged: (text) {
                  },
                ),
              ),
            ),
            // Text("data"),
          Text("あなたの発案を書き殴ってください"),
          

          TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '数値',
                      // enabledBorder: UnderlineInputBorder(
                      //     borderSide: BorderSide(color: Colors.grey)),
                      //     focusedBorder: UnderlineInputBorder(
                      //       borderSide: BorderSide(color: Colors.blue)
                      //     )
                          
                          ),
                  onChanged: (text) {
                    // 	setState(() {
                    // 		value = double.tryParse(text) ?? 0;
                    // 	}
                    // );
                  },
                ),
              

          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text("padding"),
          ),
          
          Text("data"),
        ]),
      ),
    );
  }
}
