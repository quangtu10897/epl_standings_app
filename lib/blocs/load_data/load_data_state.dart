part of 'load_data_bloc.dart';

abstract class LoadDataState extends Equatable {
  const LoadDataState();

  @override
  List<Object> get props => [];
}

class DataLoading extends LoadDataState {}

class DataLoaded extends LoadDataState {
  final List<Standing> list;
  const DataLoaded({this.list = const <Standing>[]});
  @override
  List<Object> get props => [list];
}

class DataError extends LoadDataState {
  final String message;
  final List<Standing> list;
  const DataError({required this.message, this.list = const <Standing>[]});
  @override
  List<Object> get props => [message, list];
}
