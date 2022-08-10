import 'package:bloc2/blocs/load_data/load_data_bloc.dart';
import 'package:bloc2/cubit/season_cubit.dart';
import 'package:bloc2/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //late LoadDataBloc loadDataBloc;
  //late DetailsDataBloc detailsDataBloc;

  @override
  void initState() {
    super.initState();
    context.read<LoadDataBloc>()
      ..add(LoadedData(
          season: context.read<SeasonCubit>().state, searchKeyword: ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('English Premier League Standing')),
        backgroundColor: Colors.blue[700],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    onChanged: (value) {
                      context.read<LoadDataBloc>().add(LoadedData(
                          season: context.read<SeasonCubit>().state,
                          searchKeyword: value));
                    },
                    decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(12),
                        // ),
                        labelText: tr('Search'),
                        suffixIcon: const Icon(Icons.search)),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: BlocBuilder<LoadDataBloc, LoadDataState>(
                    
                    builder: (context, state) {
                      if (state is DataLoaded) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: DropdownButton<String>(
                              underline: const SizedBox(),
                              value: state.season,
                              elevation: 0,
                              style: const TextStyle(color: Colors.deepPurple),
                              onChanged: (String? newValue) {
                                context.read<SeasonCubit>().emit(newValue!);
                                context.read<LoadDataBloc>().add(LoadedData(
                                    season: newValue, searchKeyword: ''));
                              },
                              items: <String>[
                                '2021',
                                '2020',
                                '2019',
                                '2018',
                                '2017',
                                '2016'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      } else {
                        return const Text('');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
            child: Row(
              children: [
                Text(
                  tr('Rank'),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(
                  width: 60,
                ),
                Text(
                  tr('Name'),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 170,
                ),
                Text(
                  tr('Point'),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
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
                    padding: const EdgeInsets.only(left: 20, right: 20),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                          team: state.list[index])));
                            },
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
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
                return const Text('Error');
              }
            },
          ),
        ],
      ),
    );
  }
}
