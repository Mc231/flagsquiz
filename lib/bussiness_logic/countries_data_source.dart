import 'package:flagsquiz/models/continent.dart';
import 'package:flagsquiz/models/country.dart';

class CountriesDataSource {
  final List<Country> dataSource;

  CountriesDataSource(this.dataSource);

  List<Country> getByContinent(Continent continent) {
    var result = dataSource;
    if (continent == Continent.all) {
      return result;
    }
    result.removeWhere((element) => element.continent != continent);
    return result;
  }
}
