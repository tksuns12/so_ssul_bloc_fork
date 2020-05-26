import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:so_ssul_bloc_fork/constants/constants.dart';

class NovelListItem {
  final String authorId;
  final String title;
  final int participantsNumber;
  final int partLimit;
  final List<String> tags;
  final String authorNickname;
  final int likes;

  NovelListItem(this.authorId, this.title, this.participantsNumber,
      this.partLimit, this.tags, this.authorNickname, this.likes);

  factory NovelListItem.fromSnapshot(DocumentSnapshot snapshot) {
    return NovelListItem(
        snapshot.data[DBKeys.kRoomAuthorIDKey],
        snapshot.data[DBKeys.kRoomTitleKey],
        snapshot.data[DBKeys.kRoomParticipantsNumberKey],
        snapshot.data[DBKeys.kRoomParticipantLimitKey],
        snapshot.data[DBKeys.kRoomTagsKey],
        snapshot.data[DBKeys.kRoomAuthorNicknameKey],
        snapshot.data[DBKeys.kRoomLikesKey]);
  }
}