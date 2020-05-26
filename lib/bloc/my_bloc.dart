import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_event.dart';
part 'my_state.dart';

class MyBloc extends Bloc<MyEvent, MyState> {
  @override
  MyState get initialState => MyInitial();

  @override
  Stream<MyState> mapEventToState(
    MyEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
