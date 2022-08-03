part of 'details_data_bloc.dart';

abstract class DetailsDataEvent extends Equatable {
  const DetailsDataEvent();

  @override
  List<Object> get props => [];
}

class LoadDetails extends DetailsDataEvent {
  final List<Standing> list;
  final int index;
  const LoadDetails({this.list = const <Standing>[], required this.index});
  @override
  List<Object> get props => [list, index];
}
