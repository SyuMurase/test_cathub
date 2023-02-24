import 'package:flutter/material.dart';
//firebase追加

class User {
  String name;
  String uid;
  String? imagePath;
  String lastMessage;

  User(
      {required this.name,
      required this.uid,
      this.imagePath,
      this.lastMessage = ''});
}

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<User> userList = [
    User(name: '田中', uid: 'abc', imagePath: "", lastMessage: 'こんにちは'),
    User(name: '加藤', uid: 'def', imagePath: "", lastMessage: 'おはよう'),
    User(name: '加藤', uid: 'def', imagePath: "", lastMessage: 'おはよう'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Top Page")),
        body: ListView.builder(
            itemCount: userList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  print('object');
                },
                child: SizedBox(
                  height: 70,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CircleAvatar(
                          backgroundImage: userList[index].imagePath == null
                              ? null
                              : NetworkImage(userList[index].imagePath!),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start, //左づめ
                        mainAxisAlignment: MainAxisAlignment.center, //文字を真ん中から
                        children: [
                          Text(
                            userList[index].name,
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            userList[index].lastMessage,
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
