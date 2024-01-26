import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LanguageSetting {

  // deutsch('deutsch'),
    english('english');

  const LanguageSetting(this.name);
  final String name;

  static LanguageSetting? getEnum(String name) {
    if (name == 'english') return LanguageSetting.english;
    //if (name == 'deutsch') return LanguageSetting.deutsch;
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

final mainLanguageProvider 
= StateNotifierProvider<MainLanguageNotifier, String>((ref) 
=> MainLanguageNotifier(),);

class MainLanguageNotifier extends StateNotifier<String> {
  MainLanguageNotifier() : super('') {
    _getData();
  }

  final pref = MainLanguagePreference();

  Future<void> _getData() async {
    final fetchData = await pref.getStoredValue() ?? '';
    state = fetchData;
  }

   void updateData({required String newData}) {
    // Update the state with the new data
    state = newData;

    // Also, save the new data to SharedPreferences
    _saveData(newData);
  }

  Future<void> _saveData(String newData) async {
    await pref.saveValue(value: newData);
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

final showNumberOfLikeProvider 
= StateNotifierProvider<ShowNumberOfLikeNotifier, bool>((ref) 
=> ShowNumberOfLikeNotifier(),);

class ShowNumberOfLikeNotifier extends StateNotifier<bool> {
  ShowNumberOfLikeNotifier() : super(false) {
    _getData();
  }

  final pref = ShowNumberOfLikePreference();

  Future<void> _getData() async {
    final fetchData = await pref.getStoredValue() ?? false;
    state = fetchData;
  }

   void updateData({required bool newData}) {
    // Update the state with the new data
    state = newData;

    // Also, save the new data to SharedPreferences
    _saveData(newData);
  }

  Future<void> _saveData(bool newData) async {
    await pref.saveValue(value: newData);
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

final hideNumberParticipantProvider 
= StateNotifierProvider<HideNumberParticipantNotifier, bool>((ref) 
=> HideNumberParticipantNotifier(),);

class HideNumberParticipantNotifier extends StateNotifier<bool> {
  HideNumberParticipantNotifier() : super(false) {
    _getData();
  }

  final pref = HideNumberParticipantPreference();

  Future<void> _getData() async {
    final fetchData = await pref.getStoredValue() ?? false;
    state = fetchData;
  }

   void updateData({required bool newData}) {
    // Update the state with the new data
    state = newData;

    // Also, save the new data to SharedPreferences
    _saveData(newData);
  }

  Future<void> _saveData(bool newData) async {
    await pref.saveValue(value: newData);
  }
}
