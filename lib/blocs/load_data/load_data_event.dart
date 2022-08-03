part of 'load_data_bloc.dart';

abstract class LoadDataEvent extends Equatable {
  const LoadDataEvent();

  @override
  List<Object> get props => [];
}

class LoadedData extends LoadDataEvent {
  final String season;
  final String searchKeyword;
  const LoadedData({required this.season, required this.searchKeyword});
  @override
  List<Object> get props => [season];
}
