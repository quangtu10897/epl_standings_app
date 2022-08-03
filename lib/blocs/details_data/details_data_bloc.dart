import 'package:bloc2/models/standing.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'details_data_event.dart';
part 'details_data_state.dart';

class DetailsDataBloc extends Bloc<DetailsDataEvent, DetailsDataState> {
  DetailsDataBloc() : super(DetailInit()) {
    on<LoadDetails>((event, emit) {
      List<Standing> list = event.list;
      Standing team = list[event.index];
      emit(DetailsDataLoaded(team: team));
    });
  }
}
