import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'screen8Event.dart';
part 'screen8State.dart';

class Screen8Bloc extends Bloc<Screen8Event, Screen8State> {
  Screen8Bloc() : super(StaticPlayerState()) {
    on<StaticPlayerEvent>((event, emit) {
      emit(StaticPlayerState());
    });

    on<YoutubePlayerEvent>((event, emit) {
      emit(YoutubePlayerState(seekPosition: event.seekPosition));
    });
  }
}
