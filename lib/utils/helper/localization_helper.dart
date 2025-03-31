import 'package:shared_preferences/shared_preferences.dart';
import 'package:form_builder_train/utils/app_strings.dart';

class LocalizationHelper {
  static String _currentLanguage = 'en'; 

  static String get currentLanguage => _currentLanguage; 

  // Load the current language from SharedPreferences
  static Future<void> loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _currentLanguage = prefs.getString('language') ?? 'en';
  }

  // Get the localized string for a key (e.g., country name, validation message)
  static String getString(String key) {
    return AppStrings.localizedStrings[_currentLanguage]?[key] ?? key;
  }

  // Get a list of countries
  static List<String> getCountries() {
    String countries = AppStrings.localizedStrings[_currentLanguage]?['countries'] ?? '';
    return countries.split(',');
  }

  // Get the list of cities for a specific country
  static List<String> getCities(String country) {
    String citiesKey = 'cities_$country';
    String cities = AppStrings.localizedStrings[_currentLanguage]?[citiesKey] ?? '';
    return cities.split(',');
  }

  // Set the current language in SharedPreferences and update the _currentLanguage variable
  static Future<void> setLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode);
    _currentLanguage = languageCode;
  }
}
