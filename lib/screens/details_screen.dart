import 'package:bloc2/blocs/charts_data/charts_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/details_data/details_data_bloc.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late DetailsDataBloc detailsDataBloc;
  @override
  void initState() {
    super.initState();
    context.read<DetailsDataBloc>();
    context.read<ChartsBloc>();
  }

  // final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(tr('Details Screen')),
          backgroundColor: Colors.blue,
        ),
        body: BlocBuilder<DetailsDataBloc, DetailsDataState>(
          builder: ((context, state) {
            if (state is DetailsDataLoaded) {
              return Column(
                children: [
                  Text(state.team.team.name),
                  Text('${state.team.stats![0].value}'),
                  Text('${state.team.stats![1].value}'),
                  Text('${state.team.stats![2].value}'),
                  Text('${state.team.stats![3].value}'),
                  Text('${state.team.stats![4].value}'),
                  Text('${state.team.stats![5].value}'),
                  Text('${state.team.stats![6].value}'),
                  TextButton(
                    onPressed: () {
                      context.read<ChartsBloc>()
                        ..add(ParseData(
                            wins: state.team.stats![0].value,
                            loss: state.team.stats![1].value,
                            ties: state.team.stats![2].value,
                            logo: state.team.team.logo[0].href));
                      Navigator.pushNamed(context, '/charts');
                    },
                    child: Text(tr('Next')),
                  )
                ],
              );
            }
            return const Text('error');
          }),
        ));
  }
}
