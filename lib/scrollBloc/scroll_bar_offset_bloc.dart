import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'scroll_bar_offset_event.dart';
part 'scroll_bar_offset_state.dart';

class ScrollBarOffsetBloc
    extends Bloc<ScrollBarOffsetEvent, ScrollBarOffsetState> {
  ScrollBarOffsetBloc() : super(ScrollBarOffsetValue(offset: 0)) {
    on<ScrollBarOffsetValueEvent>((event, emit) {
      emit(ScrollBarOffsetValue(offset: event.offset));
    });
  }
}
