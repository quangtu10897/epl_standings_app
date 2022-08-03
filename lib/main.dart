import 'package:bloc2/blocs/details_data/details_data_bloc.dart';
import 'package:bloc2/blocs/load_data/load_data_bloc.dart';
import 'package:bloc2/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => LoadDataBloc()),
        BlocProvider(create: (BuildContext context) => DetailsDataBloc()),
      ],
      child: MaterialApp(
        initialRoute: '/navigator',
        routes: {
          // '/homeScreen': (context) => HomeScreen(),
          '/navigator': (context) => const NavigatorScreen(),
          '/details': (context) => const DetailsScreen()
        },
      ),
    );
  }
}
