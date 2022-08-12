part of 'charts_bloc.dart';

abstract class ChartsState extends Equatable {
  const ChartsState();

  @override
  List<Object> get props => [];
}

class ChartsInitial extends ChartsState {}

class ChartsData extends ChartsState {
  final double winRate;
  final double lossRate;
  final double tiesRate;
  final String logo;

  const ChartsData(
      {required this.lossRate,
      required this.tiesRate,
      required this.winRate,
    required this.logo
  });
  @override
  List<Object> get props => [winRate, lossRate, tiesRate];
}
