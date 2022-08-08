part of 'bottom_navigator_bloc.dart';

abstract class BottomNavigatorState extends Equatable {
  const BottomNavigatorState();

  @override
  List<Object> get props => [];
}

class BottomNavigatorInitial extends BottomNavigatorState {}

class BottomNavigatorLoaded extends BottomNavigatorState {
  final int index;

  const BottomNavigatorLoaded({
    required this.index,
  });
  @override
  List<Object> get props => [index];
}

class BottomNavigatorError extends BottomNavigatorState {
  final String message;
  const BottomNavigatorError({required this.message});
}
