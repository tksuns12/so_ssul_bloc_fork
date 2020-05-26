part of 'room_bloc.dart';

abstract class RoomState extends Equatable {
  const RoomState();
}

class RoomInitial extends RoomState {
  @override
  List<Object> get props => [];
}
