import 'package:bottom_nav/firebase/room_firestore.dart';
import 'package:bottom_nav/model/shared_prefarence.dart';
import 'package:bottom_nav/model/top_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserFirestore {
  static final FirebaseFirestore _firebaseFirestoreInstance =
      FirebaseFirestore.instance;
  static final _userCollection = _firebaseFirestoreInstance.collection('user');

  static Future<String?> createUser() async {
    try {
      // await _userCollection.add({'name': 'テスト', '年齢': '二十歳'});
      final newDoc =
          await _userCollection.add({'name': 'メンバー3', 'imagepath': 'abc'});
      // await _userCollection.add({'name': 'メンバー2', 'imagepath': 'abcd'});
      print('アカウント作成!');
      return newDoc.id;
    } catch (e) {
      print('error: $e');
      return null;
    }
  }

  static Future<void> ConformCreateUser() async {
    final myuid = await createUser();
    if (myuid != null) {
      RoomFirestore.createRoom(myuid);
      SharedPrefs.setUid(myuid);
    }
  }

  static Future<List<QueryDocumentSnapshot>?> fetchUsers() async {
    try {
      final snapshot = await _userCollection.get();
      // snapshot.docs.forEach((doc) {
      //   print(
      //       'ドキュメント${doc.id}---${doc.data()['name']}----${doc.data()['imagepath']}');
      // });
      return snapshot.docs;
    } catch (e) {
      print('$e');
      return null;
    }
  }

  ///端末にアカウントがある場合とない場合の処理
  static Future<User?> fetchMyProfile() async {
    try {
      String uid = SharedPrefs.fetchUid()!;
      final myProfile = await _userCollection.doc(uid).get();
      User user = User(
          name: myProfile.data()!['name'],
          imagePath: myProfile.data()!['imagepath'],
          uid: uid);
      return user;
    } catch (e) {
      print('$e');
    }
  }

  //第21回でfetchMyprefileをfetchProfileに改変している
  static Future<User?> fetchProfile(String uid) async {
    try {
      // String uid = SharedPrefs.fetchUid()!;
      final snapshot = await _userCollection.doc(uid).get();
      User user = User(
          name: snapshot.data()!['name'],
          imagePath: snapshot.data()!['imagepath'],
          uid: uid);
      return user;
    } catch (e) {
      print('$e');
      return null;
    }
  }
}
