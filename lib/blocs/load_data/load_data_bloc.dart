import 'package:bloc2/dio/dio.dart';
import 'package:bloc2/models/football.dart';
import 'package:bloc2/models/standing.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'load_data_event.dart';
part 'load_data_state.dart';

class LoadDataBloc extends Bloc<LoadDataEvent, LoadDataState> {
  DioClient dioClient = DioClient();
  LoadDataBloc() : super(DataLoading()) {
    on<LoadedData>(
      (event, emit) async {
        List<Football> listFb = await dioClient.fetchData(event.season);
        List<Standing> results = [];
        if (event.searchKeyword.isEmpty) {
          results = listFb[0].data.standings!;
        } else {
          results = listFb[0]
              .data
              .standings!
              .where((user) => user.team.name
                  .toLowerCase()
                  .contains(event.searchKeyword.toLowerCase()))
              .toList();
        }
        emit(DataLoaded(list: results, season: event.season));
      },
    );
  }
}
