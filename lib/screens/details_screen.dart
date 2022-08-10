import 'package:bloc2/blocs/charts_data/charts_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/standing.dart';

class DetailsScreen extends StatefulWidget {
  final Standing team;
  const DetailsScreen({Key? key, required this.team}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<String> list = [
    'Wins',
    'Loss',
    'Ties',
    'GamesPlay',
    'Goal',
    'GoalConcede',
    'Point',
  ];
  // late DetailsDataBloc detailsDataBloc;
  // @override
  void initState() {
    super.initState();
    //context.read<DetailsDataBloc>();
    //context.read<ChartsBloc>();
    //context.read<FootballTeamBloc>();
  }

  // final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text(tr('Details Screen')),
          backgroundColor: Colors.blue,
        ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Center(
              child: Text(
                widget.team.team.name,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Pacifico',
                  color: Colors.grey[800],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: CircleAvatar(
            backgroundImage: NetworkImage(widget.team.team.logo[0].href),
            backgroundColor: Colors.grey[300],
            radius: 40,
          )),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Team Details',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  backgroundColor: Colors.grey[300],
                  color: Colors.grey[700],
                  letterSpacing: 1.0),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(5.0),
                      height: 300,
                      width: 160,
                      color: Colors.blue[300],
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(25, 16, 0, 0),
                              child: Text(
                                '${list[index]} :',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            );
                          }),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 300,
                      width: 150,
                      margin: EdgeInsets.all(5.0),
                      color: Colors.blue,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                            child: Center(
                              child: Text(
                                '${widget.team.stats![index].value}',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: InkWell(
              onTap: () {},
              child: Container(
                child: Center(child: Text(tr("Next"))),
                height: 56,
                width: 240,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
