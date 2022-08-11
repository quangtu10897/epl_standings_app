import 'package:bloc2/models/standing.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'charts_event.dart';
part 'charts_state.dart';

class ChartsBloc extends Bloc<ChartsEvent, ChartsState> {
  ChartsBloc() : super(ChartsInitial()) {
    on<ParseData>(_onParseData);
  }
  void _onParseData(ParseData event, Emitter<ChartsState> emit) {
    int wins = event.team.stats![0].value;
    int loss = event.team.stats![1].value;
    String logo = event.team.team.logo[0].href;
    double w = (wins / 38) * 100;
    double l = (loss / 38) * 100;
    double winrate = num.parse(w.toStringAsFixed(2)) as double;
    double lossrate = num.parse(l.toStringAsFixed(2)) as double;
    double t = 100 - (winrate + lossrate);
    double tiesrate = num.parse(t.toStringAsFixed(2)) as double;
    emit(ChartsData(
        lossrate: lossrate, tiesrate: tiesrate, winrate: winrate,
        logo: logo));
  }
}
