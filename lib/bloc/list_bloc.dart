import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:so_ssul_bloc_fork/models/room_model.dart';
import 'package:so_ssul_bloc_fork/repository/firestore_repository.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  Repository _repo = Repository();
  @override
  ListState get initialState => ListInitial();

  @override
  Stream<ListState> mapEventToState(
    ListEvent event,
  ) async* {
    if (event is CleanLoadList) {
      yield* _mapCleanLoadListToState(event.sortingOption, event.tagFilters);
    } else if (event is LoadMoreList) {
      yield* _mapLoadMoreListToState(event.lastItem);
    } else if (event is ChangeSortingOption) {
      yield* _mapChangeSortingOptionToState(event.sortingOption);
    } else if (event is AddFilterTag) {
      yield* _mapAddFilterTagToState(event.tag);
    } else if (event is RemoveFilterTag) {
      yield* _mapRemoveFilterTagToState(event.tag);
    }
  }

  Stream<ListState> _mapCleanLoadListToState(
      SortingOption sortingOption, List<String> tagFilters) async* {
    try {
      List<NovelListItem> novels;
      _repo
          .getNovelList(sortingOption, tagFilters, null)
          .then((snapshots) => novels = snapshots.documents
              .map((document) => NovelListItem.fromSnapshot(document))
              .toList())
          .catchError((error) => throw error);
      yield (state as ListLoaded).copyWith(null, novels, null);
    } catch (error) {
      ListLoadingFailed(error);
    }
  }

  Stream<ListState> _mapLoadMoreListToState(DocumentSnapshot lastItem) async* {
    if (state is ListLoaded) {
      try {
        List<NovelListItem> novels = (state as ListLoaded).novels;
        DocumentSnapshot lastItem;
        _repo
            .getNovelList((state as ListLoaded).sortingOption,
                (state as ListLoaded).tagFilters, lastItem)
            .then((snapshots) {
          novels.addAll(snapshots.documents
              .map((document) => NovelListItem.fromSnapshot(document))
              .toList());
          lastItem = snapshots.documents[snapshots.documents.length - 1];
        }).catchError((error) => throw error);
        yield ListLoaded().copyWith(null, novels, null);
      } catch (error) {
        yield ListLoadingFailed(error);
      }
    }
  }

  Stream<ListState> _mapChangeSortingOptionToState(
      SortingOption sortingOption) async* {
    if (state is ListLoaded) {
      add(CleanLoadList(sortingOption, (state as ListLoaded).tagFilters));
    }
  }

  _mapAddFilterTagToState(String tag) async* {
    if (state is ListLoaded) {
      List<String> tags = (state as ListLoaded).tagFilters;
      tags.add(tag);
      add(CleanLoadList((state as ListLoaded).sortingOption, tags));
    }
  }

  _mapRemoveFilterTagToState(String tag) async* {
    if (state is ListLoaded) {
      List<String> tags = (state as ListLoaded).tagFilters;
      tags.remove(tag);
      add(CleanLoadList((state as ListLoaded).sortingOption, tags));
    }
  }
}
