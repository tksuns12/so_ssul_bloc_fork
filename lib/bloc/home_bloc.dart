import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:so_ssul_bloc_fork/models/home_model.dart';
import 'package:so_ssul_bloc_fork/repository/firestore_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  Repository _repo = Repository();

  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is FetchHomeInfo) {
      yield* _mapFetchHomeInfoToState();
    }
  }

  Stream<HomeState> _mapFetchHomeInfoToState() async* {
    try {
      List<RecommendedRooms> rooms;
      _repo
          .getRecommendedRooms()
          .then((snapshots) => snapshots.documents
              .map((document) => RecommendedRooms.fromSnapshot(document))
              .toList())
          .catchError((error) => throw error);
      String todaysSentence =
          await _repo.getTodaysSentence().catchError((error) => throw error);
      yield HomeIsLoaded(todaysSentence: todaysSentence, rooms: rooms);
    } catch (error) {
      yield HomeLoadingFail(error);
    }
  }
}
