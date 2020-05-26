import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:so_ssul_bloc_fork/bloc/list_bloc.dart';

class Repository {
  Firestore _firestore = Firestore();

  Future<String> getTodaysSentence() async {}

  Future<QuerySnapshot> getRecommendedRooms() async {}

  Future<QuerySnapshot> getNovelList(SortingOption sortingOption, List<String> tags, DocumentSnapshot lastItem) async {}
  // TODO: 파이어스토어 관련 함수 구현

}
