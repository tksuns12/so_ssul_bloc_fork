part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class FetchHomeInfo extends HomeEvent {
  @override
  List<Object> get props => [];

}