import 'package:bottom_nav/model/shared_prefarence.dart';
import 'package:bottom_nav/model/top_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase/user_fanction.dart';
import 'firebase_options.dart';


// void main() {
//   runApp(MyApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await UserFirestore.fetchUsers(
  await SharedPreferences.getInstance();
  String? uid = SharedPrefs.fetchUid();
  final myUid = await UserFirestore.createUser();
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
      home: UserList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// class UserFirebasestore {
//   static final FirebaseFirestore _firebaseFirestoreInstore =
//       FirebaseFirestore.instance;
//   static final _userCollection = _firebaseFirestoreInstore.collection('user');

//   static Future<void> createUser() async {
//     try {
//       // users という collection へのリファレンスを user_ref という変数に代入している
//       // final users_ref = FirebaseFirestore.instance.collection('users');
//       _userCollection.add({'name': 'い', 'imagepath': 'path'});
//       print('アカウント作成されました');
//     } catch (e) {
//       print('$e');
//     }
//   }
// }

class WidgetExample extends StatelessWidget {
  const WidgetExample({Key? key}) : super(key: key);

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WidgetExample'),
      ),
      body: Center(
        child: Column(children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 5),
                ),
                child: Text("data"),
              ),
              const ListTile(
                leading: Icon(Icons.album),
                title: Text('The Enchanted Nightingale'),
                subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(child: const Text("data"), onPressed: () {}),
                  TextButton(child: const Text("data"), onPressed: () {}),
                  const SizedBox(
                    width: 8,
                  )
                ],
              ),
            ],
          ),

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
                        borderSide: BorderSide(color: Colors.blue))),
                onChanged: (text) {},
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
