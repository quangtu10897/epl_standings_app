import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../indicator.dart';
import '../blocs/charts_data/charts_bloc.dart';

class ChartsScreen extends StatefulWidget {
  const ChartsScreen({Key? key}) : super(key: key);

  @override
  State<ChartsScreen> createState() => _ChartsScreenState();
}

class _ChartsScreenState extends State<ChartsScreen> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr('Chart Screen'),
        ),
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<ChartsBloc, ChartsState>(
        builder: (context, state) {
          if (state is ChartsData) {
            
            return Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 50,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(state.logo),
                    backgroundColor: Colors.white,
                    radius: 40,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    tr("Win-Loss Ratio"),
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Expanded(
                    child: PieChart(
                      PieChartData(
                          pieTouchData: PieTouchData(touchCallback:
                              (FlTouchEvent event, pieTouchResponse) {
                            setState(() {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                touchedIndex = -1;
                                return;
                              }
                              touchedIndex = pieTouchResponse
                                  .touchedSection!.touchedSectionIndex;
                            });
                          }),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 0,
                          centerSpaceRadius: 30,
                          sections: List.generate(3, (i) {
                            final isTouched = i == touchedIndex;
                            final fontSize = isTouched ? 25.0 : 16.0;
                            final radius = isTouched ? 60.0 : 50.0;
                            switch (i) {
                              case 0:
                                return PieChartSectionData(
                                  color: const Color(0xff0293ee),
                                  value: state.win_rate,
                                  title: '${state.win_rate}%',
                                  radius: radius,
                                  titleStyle: TextStyle(
                                      fontSize: fontSize,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xffffffff)),
                                );
                              case 1:
                                return PieChartSectionData(
                                  color: const Color(0xfff8b250),
                                  value: state.ties_rate,
                                  title: '${state.ties_rate}%',
                                  radius: radius,
                                  titleStyle: TextStyle(
                                      fontSize: fontSize,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xffffffff)),
                                );
                              case 2:
                                return PieChartSectionData(
                                  color: const Color(0xff845bef),
                                  value: state.loss_rate,
                                  title: '${state.loss_rate}%',
                                  radius: radius,
                                  titleStyle: TextStyle(
                                      fontSize: fontSize,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xffffffff)),
                                );

                              default:
                                throw Error();
                            }
                          })),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child: Column(
                      //mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Indicator(
                          color: const Color(0xff0293ee),
                          text: tr('Wins'),
                          isSquare: true,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Indicator(
                          color: const Color(0xfff8b250),
                          text: tr('Ties'),
                          isSquare: true,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Indicator(
                          color: const Color(0xff845bef),
                          text: tr('Loss'),
                          isSquare: true,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 28,
                  ),
                ],
              ),
            );
          } else {
            return const Text('error');
          }
        },
      ),
    );
  }
}
