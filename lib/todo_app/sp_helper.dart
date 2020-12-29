import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  SpHelper._();
  static SpHelper spHelper = SpHelper._();
  SharedPreferences sharedPreferences;
  initSharedPrefrences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  bool isFirstTime() {
    bool isFirstTime = sharedPreferences.getBool('isFirstTime');
    return isFirstTime ?? true;
  }

  changeFirstTime() {
    sharedPreferences.setBool('isFirstTime', false);
  }

  saveDataToSharedPrefences() {
    sharedPreferences.setBool('boolValue', true);
    sharedPreferences.setDouble('doubleValue', 50.2);
    sharedPreferences.setInt('integerValue', 20);
    sharedPreferences.setString('stringValue', 'hello');
    sharedPreferences.setStringList('listValue', ['item1', 'item2', 'item3']);
  }

  readDataFromSharedOrefrences() {
    List<String> spList = sharedPreferences.getStringList('listValue');
    print(spList);
  }

  clearDateFromSharedPrefrences() {
    sharedPreferences.remove('listValue');
    sharedPreferences.clear();
  }
}
