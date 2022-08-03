import 'dart:developer';

import 'package:bloc2/blocs/details_data/details_data_bloc.dart';
import 'package:bloc2/blocs/load_data/load_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownValue = '2021';
  late LoadDataBloc loadDataBloc;
  late DetailsDataBloc detailsDataBloc;
  late SharedPreferences prefs;
  final _key = 'season';
  @override
  void initState() {
    super.initState();
   
    loadDataBloc = context.read<LoadDataBloc>()
      ..add(LoadedData(season: dropdownValue, searchKeyword: ''));
    detailsDataBloc = context.read<DetailsDataBloc>();
  }

   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Standings'),
        backgroundColor: Colors.blue[700],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: DropdownButton<String>(
              value: dropdownValue,
              elevation: 0,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                  context.read<LoadDataBloc>().add(
                      LoadedData(season: dropdownValue, searchKeyword: ''));
                });
                
              },
              items: <String>['2021', '2020', '2019', '2018', '2017', '2016']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextField(
              onChanged: (value) {
                context.read<LoadDataBloc>().add(
                    LoadedData(season: dropdownValue, searchKeyword: value));
              },
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
          ),
          BlocBuilder<LoadDataBloc, LoadDataState>(
            builder: (context, state) {
              if (state is DataLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is DataLoaded) {
                return Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: state.list.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              detailsDataBloc.add(
                                  LoadDetails(list: state.list, index: index));
                              Navigator.pushNamed(context, '/details');
                            },
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Text('${state.list[index].stats![8].value}'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(
                                        state.list[index].team.logo[0].href),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Text(state.list[index].team.name),
                                  Expanded(
                                    child: Text(
                                      '${state.list[index].stats![6].value}',
                                      textAlign: TextAlign.end,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                );
              } else if (state is DataError) {
                return Center(child: Text(state.message));
              } else {
                return const Text('data');
              }
            },
          ),
        ],
      ),
    );
  }
}
