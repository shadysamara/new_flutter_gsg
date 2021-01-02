import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class FileHelper {
  FileHelper._();
  static FileHelper fileHelper = FileHelper._();
  saveFileOnMyDevice() async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      String filePath = join(appDocPath, 'shady.txt');
      File file = File(filePath);
      file.writeAsString('hello this is my first words in this file');
    } on Exception catch (e) {
      print(e);
    }
  }

  readFileFromMyDevice() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    try {
      String appDocPath = appDocDir.path;
      String filePath = join(appDocPath, 'shady.txt');
      File file = File(filePath);
      String content = await file.readAsString();
      print(content);
    } on Exception catch (e) {
      print(e);
    }
  }
}
