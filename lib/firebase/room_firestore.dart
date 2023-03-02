import 'package:bottom_nav/firebase/user_fanction.dart';
import 'package:bottom_nav/model/talk_room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/shared_prefarence.dart';

class RoomFirestore {
  static final FirebaseFirestore _firebaseFirestoreInstance =
      FirebaseFirestore.instance;
  static final _roomCollection = _firebaseFirestoreInstance.collection('room');

  static Future<void> createRoom(String myUid) async {
    try {
      final docs = await UserFirestore.fetchUsers();
      if (docs == null) return;
      docs.forEach((doc) async {
        if (doc.id == myUid) return;
        await _roomCollection.add({
          'jointed_user_ids': [doc.id, myUid],
          'created_times': Timestamp.now()
        });
      });
      print('ルーム作成');
    } catch (e) {
      print('ルーム作成失敗');
    }
  }

  static Future<void> fetchJoinedRooms() async {
    try {
      //firebaseから特定のユーザが参加しているルームを取ってくる
      String myUid = SharedPrefs.fetchUid()!;
      final snapshot = await _roomCollection
          .where('p0BZQSPvuHORIRPO09pU', arrayContains: myUid)
          .get();
      List<TalkRoom> talkRooms = [];
      for (var doc in snapshot.docs) {
        List<dynamic> userIds = doc.data()['p0BZQSPvuHORIRPO09pU'];
        late String talkUserUid;
        for (var id in userIds) {
          // if (id == myUid) return;
          if (id == myUid) continue;
          talkUserUid = id;
        }
        User? talkUser = await UserFirestore.fetchProfile(talkUserUid);

        final talkRoom = TalkRoom(
            roomId: doc.id,
            talkUser: talkUser,
            laseMessage: doc.data()['last_message']);
        talkRooms.add(talkRoom);
      }
    } catch (e) {
      print(('ルーム取得失敗'));
    }
  }
}
