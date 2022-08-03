import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/details_data/details_data_bloc.dart';

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
    detailsDataBloc = context.read<DetailsDataBloc>();
  }

  // final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Details Screen'),
          backgroundColor: Colors.blue,
        ),
        body: BlocBuilder<DetailsDataBloc, DetailsDataState>(
          builder: ((context, state) {
            if (state is DetailsDataLoaded) {
              return Text(state.team.team.name);
            }
            return const Text('data');
          }),
        ));
  }
}
