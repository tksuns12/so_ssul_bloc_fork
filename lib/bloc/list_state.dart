part of 'list_bloc.dart';

abstract class ListState extends Equatable {
  const ListState();
}

class ListInitial extends ListState {
  @override
  List<Object> get props => [];
}

class ListLoading extends ListState {
  @override
  List<Object> get props => [];
}

class ListLoaded extends ListState {
  final List<String> tagFilters;
  final List<NovelListItem> novels;
  final SortingOption sortingOption;

  ListLoaded(
      {this.novels,
      this.tagFilters,
      this.sortingOption = SortingOption.Date});

  ListLoaded copyWith(tagFilters, novels, sortingOption) {
    return ListLoaded(
        novels: novels ?? this.novels,
        tagFilters: tagFilters ?? this.tagFilters,
        sortingOption: sortingOption ?? this.sortingOption);
  }

  @override
  List<Object> get props => [tagFilters, novels, sortingOption];
}

class ListLoadingFailed extends ListState {
  final error;

  ListLoadingFailed(this.error);

  @override
  List<Object> get props => [];
}
