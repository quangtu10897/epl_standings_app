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
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.lightBlue[100]),
                      child: Center(
                          child: Text(
                        tr('Stats Chart'),
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(state.logo),
                    backgroundColor: Colors.white,
                    radius: 40,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 200,
                    height: 38,
                    decoration: BoxDecoration(
                        color: Colors.green[200],
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        tr("Win-Loss Ratio"),
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    width: 200,
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
                                  color: Colors.blue,
                                  value: state.winRate,
                                  title: '${state.winRate}%',
                                  radius: radius,
                                  titleStyle: TextStyle(
                                      fontSize: fontSize,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xffffffff)),
                                );
                              case 1:
                                return PieChartSectionData(
                                  color: Colors.purple,
                                  value: state.tiesRate,
                                  title: '${state.tiesRate}%',
                                  radius: radius,
                                  titleStyle: TextStyle(
                                      fontSize: fontSize,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xffffffff)),
                                );
                              case 2:
                                return PieChartSectionData(
                                  color: Colors.red,
                                  value: state.lossRate,
                                  title: '${state.lossRate}%',
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Indicator(
                          color: Colors.blue,
                          text: tr('Wins'),
                          isSquare: true,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Indicator(
                          color: Colors.purple,
                          text: tr('Ties'),
                          isSquare: true,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Indicator(
                          color: Colors.red,
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
