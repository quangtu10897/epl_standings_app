part of 'details_data_bloc.dart';

abstract class DetailsDataState extends Equatable {
  const DetailsDataState();

  @override
  List<Object> get props => [];
}

class DetailInit extends DetailsDataState {}

class DetailsDataLoaded extends DetailsDataState {
  final Standing team;
  
  const DetailsDataLoaded({required this.team});

  @override
  List<Object> get props => [team];
}
