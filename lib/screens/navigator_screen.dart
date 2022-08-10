import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'homeScreen.dart';
import 'language_screen.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({Key? key}) : super(key: key);

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const Language(),
  ];
  // @override
  // // void initState() {
  // //   super.initState();
  // //   context.read<BottomNavigatorBloc>().add(OnTapEvent(index: _selectedIndex));
  // // }

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<BottomNavigatorBloc, BottomNavigatorState>(
    //   builder: (context, state) {
    // if (state is BottomNavigatorInitial) {
    //   return const Center(child: CircularProgressIndicator());
    // }
    //if (state is BottomNavigatorLoaded) {
          return Scaffold(
            body: Center(
        child: Center(child: _widgetOptions.elementAt(_selectedIndex)),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
            label: tr(''),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
            label: tr(''),
                ),
              ],
        currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
              onTap: (int index) {
          // context
          //     .read<BottomNavigatorBloc>()
          //     .add(OnTapEvent(index: index));
          setState(() {
            _selectedIndex = index;
          });
              },
            ),
          );
    //}
    // if (state is BottomNavigatorError) {
    //   return Center(
    //     child: Text(
    //       state.message,
    //       style: const TextStyle(color: Colors.blue),
    //     ),
    //   );
    // } else {
    //   return const Text('error');
    // }
    // },
    //);
  }
}
