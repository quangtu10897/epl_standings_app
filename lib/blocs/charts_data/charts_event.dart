part of 'charts_bloc.dart';

abstract class ChartsEvent extends Equatable {
  const ChartsEvent();

  @override
  List<Object> get props => [];
}

class ParseData extends ChartsEvent {
  
  final Standing team;
  const ParseData({required this.team});
  @override
  List<Object> get props => [team];
}
