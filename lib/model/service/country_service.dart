import '../base/country_model.dart';
import '../data/country_database.dart';

/// Service class for managing and retrieving country data.
///
/// This class provides methods to access the country database and convert
/// the raw data into [Country] objects for use in the dial code picker.
///
/// The service acts as a bridge between the raw country data and the
/// application logic, providing a clean API for country operations.
///
/// Example:
/// ```dart
/// final countryService = CountryService();
/// final countries = countryService.getCountries();
///
/// // Find countries by name
/// final usCountries = countries.where((country) =>
///   country.name.toLowerCase().contains('united states')).toList();
/// ```
class CountryService {
  /// Retrieves all countries from the database as [Country] objects.
  ///
  /// This method converts the raw country data from [CountryDatabase.data]
  /// into a list of [Country] objects that can be used throughout the application.
  ///
  /// Returns a list of all available countries with their complete information
  /// including name, flag, code, and dial code.
  List<Country> getCountries() =>
      CountryDatabase.data.map((e) => Country.fromMap(e)).toList();
}
