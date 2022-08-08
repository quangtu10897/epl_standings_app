import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'charts_event.dart';
part 'charts_state.dart';

class ChartsBloc extends Bloc<ChartsEvent, ChartsState> {
  ChartsBloc() : super(ChartsInitial()) {
    on<ParseData>(_onParseData);
  }
  void _onParseData(ParseData event, Emitter<ChartsState> emit) {
    int wins = event.wins;
    int loss = event.loss;
    int ties = event.ties;
    String logo = event.logo;
    double w = (wins / 38) * 100;
    double l = (loss / 38) * 100;
    double winrate = num.parse(w.toStringAsFixed(2)) as double;
    double lossrate = num.parse(l.toStringAsFixed(2)) as double;
    double t = 100 - (winrate + lossrate);
    double tiesrate = num.parse(t.toStringAsFixed(2)) as double;
    emit(ChartsData(
        loss_rate: lossrate,
        ties_rate: tiesrate,
        win_rate: winrate,
        logo: logo));
  }
}
