part of 'scroll_bar_offset_bloc.dart';

abstract class ScrollBarOffsetState extends Equatable {}

class ScrollBarOffsetValue extends ScrollBarOffsetState {
  ScrollBarOffsetValue({required this.offset});
  int offset;
  @override
  // TODO: implement props
  List<Object?> get props => [offset];
}
