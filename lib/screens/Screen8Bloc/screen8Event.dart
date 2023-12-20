part of 'screen8Bloc.dart';

abstract class Screen8Event extends Equatable {}

class StaticPlayerEvent extends Screen8Event {
  StaticPlayerEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class YoutubePlayerEvent extends Screen8Event {
  YoutubePlayerEvent({required this.seekPosition});
  int seekPosition;
  @override
  // TODO: implement props
  List<Object?> get props => [seekPosition];
}
