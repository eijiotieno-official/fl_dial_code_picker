import '../base/country_model.dart';
import '../data/country_database.dart';

class CountryService {
  List<Country> getCountries() =>
      CountryDatabase.data.map((e) => Country.fromMap(e)).toList();
}
