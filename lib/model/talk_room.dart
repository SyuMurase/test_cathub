// ignore_for_file: empty_constructor_bodies

import 'package:bottom_nav/model/user.dart';

class TalkRoom {
  String roomId;
  User talkUser;
  String? laseMessage;

  TalkRoom(
      {required this.roomId, required this.talkUser, this.laseMessage});
}
