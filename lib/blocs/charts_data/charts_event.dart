part of 'charts_bloc.dart';

abstract class ChartsEvent extends Equatable {
  const ChartsEvent();

  @override
  List<Object> get props => [];
}

class ParseData extends ChartsEvent {
  final int wins;
  final int loss;
  final int ties;
  final String logo;
  const ParseData(
      {required this.wins,
      required this.loss,
      required this.ties,
      required this.logo});
  @override
  List<Object> get props => [wins, loss, ties];
}
