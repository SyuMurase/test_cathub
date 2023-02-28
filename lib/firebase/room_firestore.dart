
import 'package:bottom_nav/firebase/user_fanction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
}
