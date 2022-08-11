import 'package:bloc2/blocs/charts_data/charts_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
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
    tr('Wins'),
    tr('Loss'),
    tr('Ties'),
    tr('GamesPlay'),
    tr('Goal'),
    tr('GoalConcede'),
    tr('Point'),
  ];
  
  @override
  void initState() {
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text(tr('Details Screen')),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
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
              tr('Team Details'),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  backgroundColor: Colors.grey[300],
                  color: Colors.grey[700],
                  letterSpacing: 1.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    height: 300,
                    width: 170,
                    color: Colors.blue[200],
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(40, 16, 0, 0),
                            child: Text(
                              '${list[index]} :',
                              style: const TextStyle(
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
                    margin: const EdgeInsets.all(5.0),
                    color: Colors.blue[200],
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                          child: Center(
                            child: Text(
                              '${widget.team.stats![index].value}',
                              style: const TextStyle(
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
          const SizedBox(
            height: 30,
          ),
          Center(
            child: InkWell(
              onTap: () {
                context.read<ChartsBloc>().add(ParseData(team: widget.team));
                Navigator.pushNamed(context, '/charts');
              },
              child: Container(
                height: 56,
                width: 270,
                decoration: BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Text(
                  tr("Advance Stats"),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                )),
              ),
              
            ),
          ),
         
        ],
      ),
    );
  }
}
