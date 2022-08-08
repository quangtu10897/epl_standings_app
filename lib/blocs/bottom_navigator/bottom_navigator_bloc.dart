import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigator_event.dart';
part 'bottom_navigator_state.dart';

class BottomNavigatorBloc
    extends Bloc<BottomNavigatorEvent, BottomNavigatorState> {
  BottomNavigatorBloc() : super(BottomNavigatorInitial()) {
    on<OnTapEvent>(((event, emit) {
      try {
        int index = event.index;
        emit(BottomNavigatorLoaded(index: index));
      } catch (e) {
        emit(const BottomNavigatorError(message: "Error!!"));
      }
    }));
  }
}
