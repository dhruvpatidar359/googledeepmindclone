part of 'scroll_bar_offset_bloc.dart';

abstract class ScrollBarOffsetEvent  extends Equatable{}

class ScrollBarOffsetValueEvent extends ScrollBarOffsetEvent{
  ScrollBarOffsetValueEvent( this.offset);
  final int offset;
  @override
  // TODO: implement props
  List<Object?> get props => [offset];

}
