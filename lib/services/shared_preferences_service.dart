import 'package:esewa_hci/app/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SharedPreferencesService {
  final _logger = getLogger("SharedPreferencesService");
  static const String userKey = "USERKEY";
  static const String totalScannedKey = "TOTALSCANNEDKEY";
  static const String onboardingKey = "ONBOARDINGKEY";
  static const String localeCodeKey = "LOCALECODEKEY";
  final SharedPreferences _preferences;

  SharedPreferencesService(this._preferences);

  String get localeCode {
    final String localeCodeVal = _getFromDisk(localeCodeKey) as String;
    if (localeCodeVal == null || localeCodeVal.isEmpty) {
      return null;
    }
    return localeCodeVal;
  }

  Future<void> setLocaleCode(String localeCode) async {
    await _saveToDisk(localeCodeKey, localeCode);
  }

  bool get onboardingVisited {
    final visited = _getFromDisk(onboardingKey);
    if (visited != null) {
      return visited as bool && true;
    }
    return false;
  }

  Future<void> setOnboardingVisited() async {
    await _saveToDisk(onboardingKey, true);
  }

  dynamic _getFromDisk(String key) => _preferences.get(key);

  Future<void> _saveToDisk<T>(String key, T content) async {
    _logger.d('_saveStringToDisk called key: $key returned value: $content');

    if (content is String) {
      await _preferences.setString(key, content);
    }
    if (content is bool) {
      await _preferences.setBool(key, content);
    }
    if (content is int) {
      await _preferences.setInt(key, content);
    }
    if (content is double) {
      await _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      await _preferences.setStringList(key, content);
    }
  }

  Future<void> removeLocaleCode() async {
    _logger.d("removeLocaleCode called");
    await _preferences.remove(localeCodeKey);
    _logger.d("LocaleCode removed");
  }

  Future<void> removeOnboardingVisited() async {
    _logger.d("removeOnboardingVisited called");
    await _preferences.remove(onboardingKey);
    _logger.d("Onboarding visited removed");
  }
}
