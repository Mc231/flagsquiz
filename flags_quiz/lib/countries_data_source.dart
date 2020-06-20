import 'package:flagsquiz/models/continent.dart';
import 'package:flagsquiz/models/country.dart';

class CountriesDataSource {
  final Map<String, Country> dataSource;

  List<String> get flags => dataSource.keys as List<String>;
  List<Country> get countries => dataSource.values as List<Country>;

  CountriesDataSource(this.dataSource);

  Map<String, Country> getByContinent(Continent continent) {
    var result = dataSource;
    return Map.from(result)..removeWhere((k, v) => v.continent != continent);
  }
}
