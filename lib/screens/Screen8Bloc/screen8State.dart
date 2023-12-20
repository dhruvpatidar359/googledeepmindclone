part of 'screen8Bloc.dart';

abstract class Screen8State extends Equatable {}

class StaticPlayerState extends Screen8State {
  StaticPlayerState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class YoutubePlayerState extends Screen8State {
  YoutubePlayerState({required this.seekPosition});
  int seekPosition;

  @override
  // TODO: implement props
  List<Object?> get props => [seekPosition];
}
