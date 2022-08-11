import 'package:bloc2/cubit/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  String dropdownValue = 'English';
  late SharedPreferences prefs;
  final languageKey = 'language';
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(tr('Language Settings')),
          backgroundColor: Colors.blue[700],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(children: [
            Text(
              tr("LANGUAGE"),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  tr('Choose Language'),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                DropdownButton(
                  value: context.read<LanguageCubit>().state,
                  items: <String>[
                    'English',
                    'Vietnammese',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      if (dropdownValue == 'English') {
                        context.setLocale(const Locale('en'));
                      } else if (dropdownValue == 'Vietnammese') {
                        context.setLocale(const Locale('vi'));
                      }
                      
                      context.read<LanguageCubit>().emit(dropdownValue);
                    });
                  },
                ),
              ],
            )
          ]),
        ));
  }
}
