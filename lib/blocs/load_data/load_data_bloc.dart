import 'package:bloc2/fetchData.dart';
import 'package:bloc2/models/football.dart';
import 'package:bloc2/models/standing.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'load_data_event.dart';
part 'load_data_state.dart';

class LoadDataBloc extends Bloc<LoadDataEvent, LoadDataState> {
  LoadDataBloc() : super(DataLoading()) {
    on<LoadedData>(
      (event, emit) async {
        try {
          List<Football> listFb = await fetchData(event.season);
          List<Standing> list = listFb[0].data.standings!;
          List<Standing> results = list;
          if (event.searchKeyword.isEmpty) {
            results = list;
          } else {
            results = list
                .where((user) => user.team.name
                    .toLowerCase()
                    .contains(event.searchKeyword.toLowerCase()))
                .toList();
          }
          emit(DataLoaded(list: results));
        } catch (e) {
          emit(const DataError(message: 'error'));
        }
      },
    );
  }
}
