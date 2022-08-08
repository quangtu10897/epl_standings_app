import 'package:bloc2/blocs/bottom_navigator/bottom_navigator_bloc.dart';
import 'package:bloc2/blocs/charts_data/charts_bloc.dart';
import 'package:bloc2/blocs/details_data/details_data_bloc.dart';
import 'package:bloc2/blocs/load_data/load_data_bloc.dart';
import 'package:bloc2/screens/charts_screen.dart';
import 'package:bloc2/cubit/season_cubit.dart';
import 'package:bloc2/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/homeScreen.dart';
import 'screens/navigator_screen.dart';
import 'package:easy_localization/easy_localization.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale("en"), Locale("vi")],
      path: 'assets/translations',
      fallbackLocale: const Locale("en"),
      child: const MyApp(),
    ),
  );
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
        BlocProvider<SeasonCubit>(create: ((context) => SeasonCubit())),
        BlocProvider(create: (BuildContext context) => LoadDataBloc()),
        BlocProvider(create: (BuildContext context) => DetailsDataBloc()),
        BlocProvider(create: (BuildContext context) => BottomNavigatorBloc()),
        BlocProvider(create: (BuildContext context) => ChartsBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        initialRoute: '/navigator',
        routes: {
          '/homeScreen': (context) => const HomeScreen(),
          '/navigator': (context) => const NavigatorScreen(),
          '/details': (context) => const DetailsScreen(),
          '/charts': (context) => const ChartsScreen(),
        },
      ),
    );
  }
}
