part of 'load_data_bloc.dart';

abstract class LoadDataState extends Equatable {
  const LoadDataState();

  @override
  List<Object> get props => [];
}

class DataLoading extends LoadDataState {}

class DataLoaded extends LoadDataState {
  final List<Standing> list;
  final String season;
  const DataLoaded({this.list = const <Standing>[], required this.season});
  @override
  List<Object> get props => [list, season];
}

class DataError extends LoadDataState {
  final String message;
  final List<Standing> list;
  const DataError({required this.message, this.list = const <Standing>[]});
  @override
  List<Object> get props => [message, list];
}
