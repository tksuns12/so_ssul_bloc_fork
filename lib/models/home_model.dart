import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:so_ssul_bloc_fork/constants/constants.dart';

class RecommendedRooms{
  final String title;
  final List<String> tags;

  RecommendedRooms(this.title, this.tags);

  factory RecommendedRooms.fromSnapshot(DocumentSnapshot snapshot) {
    return RecommendedRooms(snapshot.data[DBKeys.kRoomTitleKey], snapshot.data[DBKeys.kRoomTagsKey]);
  }
}