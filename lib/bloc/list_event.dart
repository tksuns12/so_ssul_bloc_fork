part of 'list_bloc.dart';

enum SortingOption { Date, Likes, Views }

abstract class ListEvent extends Equatable {
  const ListEvent();
}

class CleanLoadList extends ListEvent {
  final SortingOption sortingOption;
  final List<String> tagFilters;

  CleanLoadList(this.sortingOption, this.tagFilters);

  @override
  List<Object> get props => [sortingOption, tagFilters];
}

class LoadMoreList extends ListEvent {
  final DocumentSnapshot lastItem;

  LoadMoreList(this.lastItem);
  @override
  List<Object> get props => [lastItem];
}

class ChangeSortingOption extends ListEvent {
  final SortingOption sortingOption;

  ChangeSortingOption(this.sortingOption);

  @override
  List<Object> get props => [sortingOption];
}

class AddFilterTag extends ListEvent {
  final String tag;

  AddFilterTag(this.tag);

  @override
  List<Object> get props => [tag];
}

class RemoveFilterTag extends ListEvent {
  final String tag;

  RemoveFilterTag(this.tag);

  @override
  List<Object> get props => [tag];
}
