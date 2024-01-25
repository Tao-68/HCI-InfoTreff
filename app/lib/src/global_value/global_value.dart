import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesHelper {
  Future<bool?> getStoredValue() async {}
  Future<void> saveValue({required bool value}) async {}
}


class ShowNumberOfLikePreference extends SharedPreferencesHelper{
  static const String _myTextKey = 'showNumberOfLikePreference';

  Future<bool?> getStoredValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_myTextKey) ?? false;
  }

  Future<void> saveValue({required bool value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_myTextKey, value);
  }
}

class HideNumberParticipantPreference extends SharedPreferencesHelper{
  static const String _myTextKey = 'hideNumberParticipant';
 
  Future<bool?> getStoredValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_myTextKey) ?? false;
  }

  Future<void> saveValue({required bool value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_myTextKey, value);
  }
}