import 'package:shared_preferences/shared_preferences.dart';

enum LanguageSetting {
  english('english'),
  deutsch('deutsch');

  const LanguageSetting(this.name);
  final String name;

  static LanguageSetting? getEnum(String name) {
    if (name == 'english') return LanguageSetting.english;
    if (name == 'deutsch') return LanguageSetting.deutsch;
    return null;
  }
}

abstract class SharedPreferencesBoolHelper {
  Future<bool?> getStoredValue();
  Future<void> saveValue({required bool value});
}

abstract class SharedPreferencesStringHelper {
  Future<String?> getStoredValue();
  Future<void> saveValue({required String value});
}

class MainLanguagePreference extends SharedPreferencesStringHelper{
  static const String _myTextKey = 'MainLanguagePreference';

  @override
  Future<String?> getStoredValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_myTextKey) ?? '';
  }

  @override
  Future<void> saveValue({required String value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_myTextKey, value);
  }
}

class ShowNumberOfLikePreference extends SharedPreferencesBoolHelper{
  static const String _myTextKey = 'showNumberOfLikePreference';

  @override
  Future<bool?> getStoredValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_myTextKey) ?? false;
  }

  @override
  Future<void> saveValue({required bool value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_myTextKey, value);
  }
}

class ShowVeganOnlyPreference extends SharedPreferencesBoolHelper{
  static const String _myTextKey = 'ShowVeganOnlyPreference';

  @override
  Future<bool?> getStoredValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_myTextKey) ?? false;
  }

  @override
  Future<void> saveValue({required bool value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_myTextKey, value);
  }
}

class HideNumberParticipantPreference extends SharedPreferencesBoolHelper{
  static const String _myTextKey = 'hideNumberParticipant';
  
  @override
  Future<bool?> getStoredValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_myTextKey) ?? false;
  }

  @override
  Future<void> saveValue({required bool value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_myTextKey, value);
  }
}
