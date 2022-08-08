part of 'bottom_navigator_bloc.dart';

abstract class BottomNavigatorEvent extends Equatable {
  const BottomNavigatorEvent();

  @override
  List<Object> get props => [];
}

class OnTapEvent extends BottomNavigatorEvent {
  final int index;
  const OnTapEvent({required this.index});
  @override
  List<Object> get props => [index];
}
