import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_nav_state.dart';
part 'bottom_nav_event.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavState()) {
    on<UpdateIndex>(_updateIndex);
    on<ResetIndex>(_resetIndex);
  }

  _updateIndex(UpdateIndex event, Emitter<BottomNavState> emit) {
    emit(state.changeIndex(event.index));
  }

  _resetIndex(ResetIndex event, Emitter<BottomNavState> emit) {
    emit(state.changeIndex(0));
  }
}
