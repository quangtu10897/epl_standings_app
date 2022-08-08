part of 'charts_bloc.dart';

abstract class ChartsState extends Equatable {
  const ChartsState();

  @override
  List<Object> get props => [];
}

class ChartsInitial extends ChartsState {}

class ChartsData extends ChartsState {
  final double win_rate;
  final double loss_rate;
  final double ties_rate;
  final String logo;

  ChartsData({
    required this.loss_rate,
    required this.ties_rate,
    required this.win_rate,
    required this.logo
  });
  @override
  List<Object> get props => [win_rate, loss_rate, ties_rate];
}
