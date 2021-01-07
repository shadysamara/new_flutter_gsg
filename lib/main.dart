import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gsg_flutter/excersice/ui/pages/excersice_page.dart';
import 'package:gsg_flutter/packagesGsg.dart';
import 'package:gsg_flutter/todo_app/providers/database_provider.dart';
import 'package:gsg_flutter/todo_app/services/db_helper.dart';
import 'package:gsg_flutter/todo_app/services/task_db_helper.dart';
import 'package:gsg_flutter/todo_app/providers/todo_provider.dart';
import 'package:gsg_flutter/todo_app/delteted/shared_test.dart';
import 'package:gsg_flutter/todo_app/delteted/sp_helper.dart';
import 'package:gsg_flutter/todo_app/ui/screens/splach.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpHelper.spHelper.initSharedPrefrences();
  await TaskDbHelper.taskDbHelper.initializeTasksDatabase();
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
    return ChangeNotifierProvider<DatabaseProvider>(
      create: (context) {
        return DatabaseProvider();
      },
      child: MaterialApp(
        home: PackagesGsk(),
        localizationsDelegates: translator.delegates, // Android + iOS Delegates
        locale: translator.locale, // Active locale
        supportedLocales: translator.locals(),
      ),
    );
  }
}

class PackagesTest extends StatelessWidget {
  _launchURLInWebsite(String url) async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInWebViewWithJavaScript(String url) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceWebView: true,
          enableJavaScript: true,
          webOnlyWindowName: 'shady');
    } else {
      throw 'Could not launch $url';
    }
  }

  _makeCall(int phoneNumber) async {
    if (await canLaunch('tel:$phoneNumber')) {
      await launch('tel:$phoneNumber');
    } else {
      print('we cant');
    }
  }

  _sendEmail(String email, String title, String content) async {
    final Uri _emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'ahmed@gmail.com',
        queryParameters: {
          'subject': 'Example Subject & Symbols are allowed!',
          'body': 'hello'
        });

    if (await canLaunch(_emailLaunchUri.toString())) {
      await launch(_emailLaunchUri.toString());
    } else {
      throw 'Could not launch $_emailLaunchUri';
    }
  }

  sendSms(int number, String content) async {
    final Uri _smsUri =
        Uri(scheme: 'sms', path: '$number', queryParameters: {'body': 'hello'});
    if (await canLaunch(_smsUri.toString())) {
      await launch(_smsUri.toString());
    } else {
      print('we cant');
    }
  }

  shareContent({String Content}) async {
    PickedFile pickedFile =
        await ImagePicker().getImage(source: ImageSource.camera);
    File file = File(pickedFile.path);
    Share.shareFiles(['${file.path}'], text: 'Great picture');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Packages')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(onPressed: () {
            shareContent();
          })
        ],
      ),
    );
  }
}
