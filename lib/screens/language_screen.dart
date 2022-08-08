import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('Language Settings')),
        backgroundColor: Colors.blue[700],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
              onPressed: (() {
                context.setLocale(const Locale('en'));
              }),
              child: Text(tr('English'))),
          TextButton(
              onPressed: (() {
                context.setLocale(const Locale('vi'));
              }),
              child: Text(tr('Vietnammese')))
        ],
      ),
    );
  }
}
