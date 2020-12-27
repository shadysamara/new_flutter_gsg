import 'package:flutter/material.dart';
import 'package:gsg_flutter/excersice/ui/pages/excersice_page.dart';
import 'package:gsg_flutter/todo_app/providers/todo_provider.dart';
import 'package:gsg_flutter/todo_app/shared_test.dart';
import 'package:gsg_flutter/todo_app/sp_helper.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

import 'todo_app/todo_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpHelper.spHelper.initSharedPrefrences();
  await translator.init(
      localeDefault: LocalizationDefaultType.device,
      languagesList: <String>['ar', 'en'],
      assetsDirectory: 'assets/langs/' // NOT YET TESTED
      );
  runApp(LocalizedApp(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoProvider>(
      create: (context) {
        return TodoProvider();
      },
      child: MaterialApp(
        home: SharedTest(),
        localizationsDelegates: translator.delegates, // Android + iOS Delegates
        locale: translator.locale, // Active locale
        supportedLocales: translator.locals(),
      ),
    );
  }
}
