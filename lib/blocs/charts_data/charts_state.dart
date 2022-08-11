part of 'charts_bloc.dart';

abstract class ChartsState extends Equatable {
  const ChartsState();

  @override
  List<Object> get props => [];
}

class ChartsInitial extends ChartsState {}

class ChartsData extends ChartsState {
  final double winrate;
  final double lossrate;
  final double tiesrate;
  final String logo;

  const ChartsData(
      {required this.lossrate,
      required this.tiesrate,
      required this.winrate,
    required this.logo
  });
  @override
  List<Object> get props => [winrate, lossrate, tiesrate];
}
