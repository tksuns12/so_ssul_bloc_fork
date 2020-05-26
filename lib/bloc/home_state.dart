part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeIsLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeIsLoaded extends HomeState {
  final String todaysSentence;
  final List<RecommendedRooms> rooms;

  HomeIsLoaded({@required this.todaysSentence, @required this.rooms});

  @override
  List<Object> get props => [todaysSentence, rooms];
}

class HomeLoadingFail extends HomeState {
  final error;

  HomeLoadingFail(this.error);

  @override
  List<Object> get props => [error];
}
